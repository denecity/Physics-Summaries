import numpy as np
import plotly.graph_objects as go
import plotly.express as px
from plotly.subplots import make_subplots
import time

def u(t, x, y, L=2, M=np.pi, c=1):
    """
    PDE solution function:
    u(t,x,y) = sin(cπt√(1/L² + 1/M²)) / (cπ√(1/L² + 1/M²)) * sin(2πx/L) * sin(πy/M)
    
    Parameters:
    - t: time
    - x, y: spatial coordinates
    - L, M: domain parameters
    - c: wave speed parameter
    """
    # Calculate the coefficient
    sqrt_term = np.sqrt(1/L**2 + 1/M**2)
    coefficient = np.sin(c * np.pi * t * sqrt_term) / (c * np.pi * sqrt_term)
    
    # Calculate the spatial terms
    sin_x = np.sin(2 * np.pi * x / L)
    sin_y = np.sin(np.pi * y / M)
    
    return coefficient * sin_x * sin_y

def create_animated_plot(L=2, M=2, c=1, t_max=4, num_frames=100):
    """
    Create an animated 3D plot of the PDE solution using Plotly
    
    Parameters:
    - L, M: domain parameters (x ∈ [0,L], y ∈ [0,M])
    - c: wave speed parameter
    - t_max: maximum time value
    - num_frames: number of frames for the animation
    """
    # Create spatial grid
    x = np.linspace(0, L, 100)
    y = np.linspace(0, M, 100)
    X, Y = np.meshgrid(x, y)
    
    # Time parameters
    t_values = np.linspace(0, t_max, num_frames)
    
    # Calculate z-limits based on the function's range
    z_max = 1 / (c * np.pi * np.sqrt(1/L**2 + 1/M**2))
    
    # Create frames for animation
    frames = []
    for i, t in enumerate(t_values):
        Z = u(t, X, Y, L, M, c)
        
        frame = go.Frame(
            data=[go.Surface(
                x=X,
                y=Y,
                z=Z,
                colorscale='Viridis',
                cmin=-z_max,
                cmax=z_max,
                colorbar=dict(title="u(t,x,y)")
            )],
            name=str(i)
        )
        frames.append(frame)
    
    # Create initial surface
    Z_initial = u(0, X, Y, L, M, c)
    
    # Create the figure
    fig = go.Figure(
        data=[go.Surface(
            x=X,
            y=Y,
            z=Z_initial,
            colorscale='Viridis',
            cmin=-z_max,
            cmax=z_max,
            colorbar=dict(title="u(t,x,y)")
        )],
        frames=frames
    )
    
    # Update layout
    fig.update_layout(
        title="Animated 3D Visualization of PDE Solution",
        scene=dict(
            xaxis_title="x",
            yaxis_title="y",
            zaxis_title="u(t,x,y)",
            xaxis=dict(range=[0, L]),
            yaxis=dict(range=[0, M]),
            zaxis=dict(range=[-z_max * 1.1, z_max * 1.1]),
            camera=dict(
                eye=dict(x=1.5, y=1.5, z=1.5)
            ),
            aspectmode='manual',
            aspectratio=dict(x=1, y=1, z=0.8)
        ),
        updatemenus=[{
            "buttons": [
                {
                    "args": [None, {"frame": {"duration": 100, "redraw": True},
                                   "fromcurrent": True, "transition": {"duration": 50}}],
                    "label": "Play",
                    "method": "animate"
                },
                {
                    "args": [[None], {"frame": {"duration": 0, "redraw": True},
                                     "mode": "immediate", "transition": {"duration": 0}}],
                    "label": "Pause",
                    "method": "animate"
                }
            ],
            "direction": "left",
            "pad": {"r": 10, "t": 87},
            "showactive": False,
            "type": "buttons",
            "x": 0.1,
            "xanchor": "right",
            "y": 0,
            "yanchor": "top"
        }],
        sliders=[{
            "active": 0,
            "yanchor": "top",
            "xanchor": "left",
            "currentvalue": {
                "font": {"size": 20},
                "prefix": "Time: ",
                "visible": True,
                "xanchor": "right"
            },
            "transition": {"duration": 300, "easing": "cubic-in-out"},
            "pad": {"b": 10, "t": 50},
            "len": 0.9,
            "x": 0.1,
            "y": 0,
            "steps": [
                {
                    "args": [
                        [str(k)],
                        {
                            "frame": {"duration": 300, "redraw": True},
                            "mode": "immediate",
                            "transition": {"duration": 300}
                        }
                    ],
                    "label": f"{t:.2f}",
                    "method": "animate"
                }
                for k, t in enumerate(t_values)
            ]
        }]
    )
    
    return fig

def plot_static_snapshots(L=2, M=2, c=1, times=[0, 0.5, 1.0, 1.5]):
    """
    Create static snapshots of the PDE solution at different times using Plotly subplots
    """
    x = np.linspace(0, L, 50)
    y = np.linspace(0, M, 50)
    X, Y = np.meshgrid(x, y)
    
    # Calculate z-limits based on the function's range
    z_max = 1 / (c * np.pi * np.sqrt(1/L**2 + 1/M**2))
    
    # Create subplots
    fig = make_subplots(
        rows=2, cols=2,
        specs=[[{'type': 'surface'}, {'type': 'surface'}],
               [{'type': 'surface'}, {'type': 'surface'}]],
        subplot_titles=[f't = {t}' for t in times]
    )
    
    # Add surfaces for each time
    for i, t in enumerate(times):
        row = i // 2 + 1
        col = i % 2 + 1
        
        Z = u(t, X, Y, L, M, c)
        
        fig.add_trace(
            go.Surface(
                x=X,
                y=Y,
                z=Z,
                colorscale='Viridis',
                cmin=-z_max,
                cmax=z_max,
                showscale=(i == 0),  # Only show colorbar for first subplot
                colorbar=dict(title="u(t,x,y)", x=1.02) if i == 0 else None
            ),
            row=row, col=col
        )
    
    # Update layout for all subplots
    fig.update_layout(
        title="PDE Solution at Different Times",
        height=800,
        scene=dict(
            xaxis_title="x",
            yaxis_title="y",
            zaxis_title="u(t,x,y)",
            xaxis=dict(range=[0, L]),
            yaxis=dict(range=[0, M]),
            zaxis=dict(range=[-z_max * 1.1, z_max * 1.1])
        ),
        scene2=dict(
            xaxis_title="x",
            yaxis_title="y",
            zaxis_title="u(t,x,y)",
            xaxis=dict(range=[0, L]),
            yaxis=dict(range=[0, M]),
            zaxis=dict(range=[-z_max * 1.1, z_max * 1.1])
        ),
        scene3=dict(
            xaxis_title="x",
            yaxis_title="y",
            zaxis_title="u(t,x,y)",
            xaxis=dict(range=[0, L]),
            yaxis=dict(range=[0, M]),
            zaxis=dict(range=[-z_max * 1.1, z_max * 1.1])
        ),
        scene4=dict(
            xaxis_title="x",
            yaxis_title="y",
            zaxis_title="u(t,x,y)",
            xaxis=dict(range=[0, L]),
            yaxis=dict(range=[0, M]),
            zaxis=dict(range=[-z_max * 1.1, z_max * 1.1])
        )
    )
    
    return fig

if __name__ == "__main__":
    # Parameters for the PDE
    L = 2  # x domain: [0, L]
    M = 2 * np.pi  # y domain: [0, M]
    c = 1  # wave speed parameter
    
    print("Creating animated 3D visualization with Plotly...")
    print(f"Domain: x ∈ [0, {L}], y ∈ [0, {M}]")
    print(f"Wave speed parameter c = {c}")
    
    # Create static snapshots first
    print("\nShowing static snapshots...")
    # fig_static = plot_static_snapshots(L, M, c)
    # fig_static.show()
    
    # Create animated plot
    print("\nCreating animated plot...")
    fig_anim = create_animated_plot(L, M, c, t_max=4, num_frames=80)
    
    # Show the animation
    fig_anim.show()
    
    # Optionally save the animation as HTML
    save_html = input("\nDo you want to save the animation as HTML? (y/n): ")
    if save_html.lower() == 'y':
        print("Saving animation as HTML...")
        fig_anim.write_html('pde_solution_animation.html')
        print("Animation saved as 'pde_solution_animation.html'")
        print("You can open this file in any web browser to view the interactive animation.")
    
    # Optionally save as static image
    save_image = input("\nDo you want to save a static snapshot as PNG? (y/n): ")
    if save_image.lower() == 'y':
        print("Saving static snapshot...")
        # Create a single frame at t=0
        x = np.linspace(0, L, 50)
        y = np.linspace(0, M, 50)
        X, Y = np.meshgrid(x, y)
        Z = u(0, X, Y, L, M, c)
        
        fig_static_single = go.Figure(data=[go.Surface(
            x=X, y=Y, z=Z,
            colorscale='Viridis'
        )])
        fig_static_single.update_layout(
            title="PDE Solution at t=0",
            scene=dict(
                xaxis_title="x",
                yaxis_title="y", 
                zaxis_title="u(t,x,y)"
            )
        )
        fig_static_single.write_image('pde_solution_snapshot.png')
        print("Static snapshot saved as 'pde_solution_snapshot.png'")
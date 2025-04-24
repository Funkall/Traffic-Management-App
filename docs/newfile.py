```python
def create_traffic_management_plan(location, style_of_works, time_frame):
    if not location or not style_of_works or not time_frame:
        raise ValueError("Invalid input parameters. Please provide location, style of works, and time frame.")
    
    # Generate traffic guidance scheme based on style of works
    traffic_guidance_scheme = generate_traffic_guidance_scheme(style_of_works)
    
    # Generate diagram showing where to position signs and tools
    diagram = generate_diagram(location)
    
    # Create traffic management plan with time frames
    traffic_management_plan = {
        "location": location,
        "style_of_works": style_of_works,
        "time_frame": time_frame,
        "traffic_guidance_scheme": traffic_guidance_scheme,
        "diagram": diagram
    }
    
    return traffic_management_plan

def generate_traffic_guidance_scheme(style_of_works):
    if style_of_works not in ["Road Resurfacing", "Construction", "Utility Works"]:
        raise ValueError("Invalid style of works. Please choose from Road Resurfacing, Construction, or Utility Works.")
    
    # Logic to generate traffic guidance scheme based on style of works
    return "Traffic guidance scheme for {} works".format(style_of_works)

def generate_diagram(location):
    if not location:
        raise ValueError("Invalid location. Please provide a valid location.")
    
    # Logic to generate diagram showing where to position signs and tools
    return "Diagram for {} location".format(location)

# Input parameters
location = "Main Street"
style_of_works = "Road Resurfacing"
time_frame = "2 weeks"

try:
    # Create traffic management plan
    traffic_management_plan = create_traffic_management_plan(location, style_of_works, time_frame)

    # Print the generated traffic management plan
    print(traffic_management_plan)
except ValueError as e:
    print("Error creating traffic management plan:", e)
```

This updated code snippet includes error handling for invalid input parameters and style of works. It will raise a `ValueError` with a specific message if any of the inputs are missing or invalid. This helps ensure that the traffic management plan is generated correctly and provides informative error messages if any issues occur.
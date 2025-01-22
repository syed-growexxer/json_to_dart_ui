final Map loginScreenJson = {
  "type": "Page",
  "title": "Login Page",
  "backgroundColor": "#fefefd",
  "alignment": "start",
  "appBarStyle": {
    "backgroundColor": "#fefefd",
    "elevation": 0,
    "titleStyle": { "fontSize": 24.0, "fontWeight": "bold", "color": "#192026" }
  },
  "components": [
    {
      "type": "Image",
      "value": "assets/logo.png",
      "style": {
        "margin": {"top": 0, "bottom": 20, "right": 20, "left": 20},
        "height": 150
      }
    },
    {
      "type": "Text",
      "value": "Welcome to the Login Page",
      "style": {
        "fontSize": 24.0,
        "fontWeight": "bold",
        "color": "#192026", // Yellow color for text
        "textAlign": "center",
        "margin": {"top": 10, "bottom": 30}
      }
    },
    {
      "type": "TextField",
      "placeholder": "Enter your email",
      "style": {
        "borderColor": "#2196F3",
        "borderWidth": 1.0,
        "borderRadius": 8.0,
        "padding": {"top": 10, "bottom": 10, "left": 15, "right": 15},
        "margin": {"bottom": 15},
        "textColor": "#000000",
        "fontSize": 16.0
      }
    },
    {
      "type": "TextField",
      "placeholder": "Enter your password",
      "obscureText": true,
      "style": {
        "borderColor": "#2196F3",
        "borderWidth": 1.0,
        "borderRadius": 8.0,
        "padding": {"top": 10, "bottom": 10, "left": 15, "right": 15},
        "margin": {"bottom": 20},
        "textColor": "#000000",
        "fontSize": 16.0
      }
    },
    {
      "type": "Button",
      "label": "Login",
      "onPress": "handleLogin",
      "style": {
        "backgroundColor": "#145ef0",
        "textColor": "#FFFFFF",
        "fontSize": 18.0,
        "borderRadius": 10.0,
        "padding": {"top": 10, "bottom": 10, "left": 10, "right": 10},
        "margin": {"top": 10},
        "width": 150
      }
    },
    {
      "type": "Text",
      "value": "---OR---",
      "style": {
        "fontSize": 14.0,
        "fontWeight": "bold",
        "color": "#192026", // Yellow color for text
        "textAlign": "center",
        "margin": {"top": 10, "bottom": 0}
      }
    },
    {
      "type": "Button",
      "label": "SignUp",
      "onPress": "handleSignUp",
      "style": {
        "backgroundColor": "#145ef0",
        "textColor": "#FFFFFF",
        "fontSize": 18.0,
        "borderRadius": 10.0,
        "padding": {"top": 10, "bottom": 10, "left": 10, "right": 10},
        "margin": {"top": 10},
        "width": 150
      }
    }
  ]
};

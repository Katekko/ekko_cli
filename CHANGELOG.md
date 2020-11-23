## 0.2.0+3
Fix app create screen

## 0.2.0+2
Fix dto generation

## 0.2.0+1
Adding default constructor for dtos

## 0.2.0

Now its possible create endpoint for ekko api aswell.

```ekko api create endpoint:<EndpointName> on <ControllerName>``` 

ControllerName is the controller that the endpoint belong.

If you have an auth controller that controls all the endpoints in your api, you can 
create directly for this controller:

```ekko api create endpoint:"Recovery Password" on Auth```

### BREAK CHANGE
EKKO APP
The command for create screen has changed for:

ekko app create screen:<ScreenName>

## 0.1.0+1

HOTFIX
- Turn the project executable

## 0.1.0

- Create screen Command
- Use: ekko create screen:<ScreeName>

## 0.0.1

- Initial version, created by Stagehand
- Thanks for Stagehand to make this boilerplate, I'm using to create a CLI for my architeture.
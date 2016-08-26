# IOS-Developer-Lession

MVC - Model Controller View

Model = what the application is how is display
Controller = how you model is presented to the user(UI logic)
View = your controller is minions

	/,\ you can cross , |||| you cann't
1. controller can always talke directly to their model
2. controller can also talk directly to their view
3. The model and view should never speak to each other
4. all the minions in it are generic object, limited( yes or no )
5. view needs to synchronized with controller, the controller sets itself as the view delegate

                    Controller(target)(outlet)(delegate)(datasource)
			/\
		       /  \
		      /    \
		model  ||||  View(action) (should, will, did)

6. controller interpret/format Model information for the view 
7. Model cannot talk to controller..contoller is UI logic and model is UI indepandent!
8. model (radio station) notification & KVO  


CLASS:  pass by refrence -> means that thing live in the heap, pass around like pass a pointer, everyone share it

STRUCT almost like class, like enum pass by value. Copy from origin, swift makes it smart IF YOU ARE NOT TOUCH Value, IT WON'T COPY THEM. 

If enum define cases type, then the function can be using 
keyword(op1: Double, op2: Double)->Double{return op1*op2}
reduce: keyword(op1,op2) return op1*op2
reduce: op1*op2 
reduce: $0*$1    register vars














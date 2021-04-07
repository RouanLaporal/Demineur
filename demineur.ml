#load "graphics.cma";;(*chargement de la bibliotheque graphique*)
open Graphics;;
let taillecarreaux = 40;;
let nbrecarreaux = 10;;
let sizeL = string_of_int(nbrecarreaux*taillecarreaux+40);;
let sizeC = string_of_int(nbrecarreaux*taillecarreaux+50);;
let size=" " ^ sizeL ^ "x" ^ sizeC;;
let gris = rgb 200 200 200 ;;(*définition de la couleur grise*)
open_graph size;;
let plan(x,y,c,couleur) =set_color couleur;fill_rect x y c c;;
plan(10,10,nbrecarreaux*taillecarreaux,gris);;
let rec tracer(x,y)=	set_color black; 
						moveto x y; 
						lineto (x+taillecarreaux*nbrecarreaux) y;
						if y<(taillecarreaux*nbrecarreaux+10) then tracer(x,y+40);;
let rec tracer2(x,y)= 	set_color black;
						moveto x y;
						lineto x (y+taillecarreaux*nbrecarreaux);
						if x<(taillecarreaux*nbrecarreaux+10) then tracer2(x+40,y);;
tracer(10,10);;
tracer2(10,10);;
let rec fermeture() = 	set_color black;
						let cle = wait_next_event[Key_pressed;Button_down] in if cle.key == '\027' then close_graph() 
						else if cle.button == true && cle.mouse_x< (taillecarreaux*nbrecarreaux+10) && cle.mouse_y < (taillecarreaux*nbrecarreaux) then 
						begin 
							fill_circle ((10+((cle.mouse_x-10)/40)*40+40/2))  (10+((cle.mouse_y-10)/40)*40+40/2) 10;
							fermeture()
						end
						
						else fermeture();;

fermeture();;

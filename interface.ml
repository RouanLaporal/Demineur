#load "graphics.cma";;
open Graphics;;

let sizeL = string_of_int(400);;
let sizeC = string_of_int(500);;
let size= sizeL ^ "x" ^ sizeC;;
let gris = rgb 200 200 200 ;;
open_graph size;;

set_window_title "Rouan Laporal";;

let plan(posX,posY,largeur,hauteur,couleur) =set_color couleur;fill_rect posX posY largeur hauteur ;;
plan(100,100,200,50,gris);;

plan(100,200,200,50,gris);;

plan(100,300,200,50,gris);;


let rec fermeture() = 	set_color black;
						let cle = wait_next_event[Key_pressed;Button_down] in if cle.key == '\027' then close_graph() 
						else if cle.button == true && cle.mouse_x<  10 && cle.mouse_x< 10 then 
						begin 
							fill_circle ((10+((cle.mouse_x-10)/40)*40+40/2))  (10+((cle.mouse_y-10)/40)*40+40/2) 10;
							fermeture()
						end
						else fermeture();;
						

fermeture();;
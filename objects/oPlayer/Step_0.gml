/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space); //on precise si le bouton est juste pressé brievement

//var est une variable temporaire
var move = key_right - key_left;

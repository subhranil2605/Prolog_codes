% Lili is happy if she dances.
happy(lili) :- dances(lili).

% Tom is hungry if he is searching for food.
hungry(tom) :- search_for_food(tom).

% Jack and Bili are friends if both of them love to play cricket.
friends(jack, bili) :- lovesCricket(jack), lovesCricket(bili).

% will go to play if school is closed, and he is free.
goToPlay(ryan) :- isClosed(school), free(ryan).
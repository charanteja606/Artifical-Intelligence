planet(earth, 12742, 149.6, 1).
planet(mars, 6779, 227.9, 2).
planet(jupiter, 139820, 778.3, 79).
planet(saturn, 116460, 1427, 82).
planet(uranus, 50724, 2871, 27).
planet(neptune, 49244, 4495, 14).

% Query all planet names
all_planets(Names) :-
    findall(Name, planet(Name, _, _, _), Names).

% Query all planets with a specific number of moons
planets_with_moons(Number_of_Moons, Planets) :-
    findall(Name, planet(Name, _, _, Number_of_Moons), Planets).

% Query planets larger than a specific diameter
planets_larger_than(Diameter, Planets) :-
    findall(Name, (planet(Name, D, _, _), D > Diameter), Planets).

% Query planets closer to the Sun than a specific distance
planets_closer_than(Distance, Planets) :-
    findall(Name, (planet(Name, _, D, _), D < Distance), Planets).

% Query the distance from the Sun for a specific planet
distance_from_sun(Planet, Distance) :-
    planet(Planet, _, Distance, _).

% Query the number of moons for a specific planet
number_of_moons(Planet, Moons) :-
    planet(Planet, _, _, Moons).

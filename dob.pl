
dob('Alice', '1990-01-15').
dob('Bob', '1985-06-30').
dob('Charlie', '1992-12-10').
dob('Diana', '1988-03-22').
add_dob(Name, DOB) :-
    assertz(dob(Name, DOB)).

all_names(Names) :-
    findall(Name, dob(Name, _), Names).

% Query all DOBs in the database
all_dobs(DOBs) :-
    findall(DOB, dob(_, DOB), DOBs).

% Query the DOB for a specific name
find_dob(Name, DOB) :-
    dob(Name, DOB).

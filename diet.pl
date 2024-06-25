% Define diet suggestions based on diseases
diet_suggestion(diabetes, 'Diabetes Diet Plan'):-
    write('Include more high-fiber foods such as vegetables, fruits, and whole grains.'),
    nl,
    write('Limit carbohydrates and sugars. Avoid sugary drinks and desserts.'),
    nl,
    write('Choose healthy fats, such as olive oil and avocados.'),
    nl.

diet_suggestion(hypertension, 'Hypertension Diet Plan'):-
    write('Reduce sodium intake. Avoid salty foods and processed foods.'),
    nl,
    write('Eat potassium-rich foods such as bananas, spinach, and sweet potatoes.'),
    nl,
    write('Choose lean proteins like fish and poultry. Limit red meat intake.'),
    nl.

% Query to suggest diet plan based on disease
suggest_diet(Disease) :-
    diet_suggestion(Disease, DietPlan),
    format('For ~w, follow the ~w.', [Disease, DietPlan]),
    nl.

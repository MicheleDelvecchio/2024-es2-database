-- NOME REPOSITORY: 2024-es2-database

-- Esercizi solo con SELECT
-- 1. Seleziona tutti i professori dal dipartimento di Informatica.
-- res: 1
SELECT *
FROM professor p 
WHERE department LIKE 'Informatica';


-- 2. Elenca tutti gli studenti iscritti nell'anno 2021.
-- res: 2
SELECT *
FROM student s 
WHERE subscription_year = 2021;


-- 3. Visualizza tutti i corsi offerti dal dipartimento di Fisica.
-- res: 1
SELECT *
FROM course c 
WHERE department LIKE 'Fisica'


-- 4. Mostra i nomi dei corsi insieme ai relativi dipartimenti.
-- res: 10
SELECT c.name, c.department
FROM course c 


-- 5. Conta il numero totale di studenti iscritti all'università.
-- res: 1 (10)
SELECT count(*)
FROM student s 


-- Esercizi con GROUP BY e HAVING
-- res: 



-- 6. Conta quanti corsi sono offerti in ogni dipartimento.
-- res: 10 (uno per dipartimento)
SELECT c.department , count(*)
FROM course c 
GROUP BY department 


-- 7. Trova i dipartimenti che hanno più di 3 corsi.
-- res: 
SELECT *
FROM course c 
WHERE c.department > 3

-- 8. Elenca il numero di studenti iscritti per ogni anno di iscrizione.
-- res: 5 (3, 2, 2, 2, 1)
SELECT s.subscription_year , count(*)
FROM student s 
GROUP BY s.subscription_year 


-- 9. Mostra il numero medio di studenti per corso in ogni dipartimento.
-- res: 
SELECT avg(cs.student_id) AS media_studenti_per_corso
FROM course_subscription cs
GROUP BY cs.course_id 


-- 10. Trova i professori che insegnano più di un corso.
-- res: 
SELECT p.name, count(c.professor_id) 
FROM professor p JOIN course c ON p.id = c.professor_id 
GROUP BY p.name 
HAVING COUNT(c.professor_id) > 1;


-- Esercizi con JOIN
-- res: 



-- 11. Mostra il nome di ogni studente insieme al nome del corso a cui sono iscritti.
-- res:30 
SELECT s.name, c.name AS corso
FROM course_subscription cs JOIN student s ON cs.student_id = s.id JOIN course c ON cs.course_id = c.id 



-- 12. Elenca tutti i corsi insieme ai nomi dei professori che li insegnano.
-- res: 10
SELECT c.name AS corso , p.name AS professore
FROM course c JOIN professor p ON c.professor_id = p.id 
GROUP BY c.name


-- 13. Trova gli studenti e i corsi relativi al dipartimento di Chimica.
-- res:   3
SELECT s.name AS studente, c.name AS corso
FROM course_subscription cs JOIN student s ON cs.student_id = s.id JOIN course c ON cs.course_id = c.id 
WHERE c.department LIKE 'Chimica'



-- 14. Visualizza i nomi degli studenti e i corsi che hanno frequentato nel 2022.
-- res: 6
SELECT s.name AS studente, c.name AS corso, s.subscription_year 
FROM course_subscription cs JOIN student s ON cs.student_id = s.id JOIN course c ON cs.course_id = c.id 
WHERE s.subscription_year = 2022


-- 15. Elencare i professori con i loro corsi e i relativi dipartimenti.
-- res: 10
SELECT p.name AS studente , c.name AS corso , p.department
FROM course c JOIN professor p ON c.professor_id = p.id


-- 16. Trova i corsi senza studenti iscritti.
-- res: 





-- 17. Mostra i corsi con più di 5 iscritti.
-- res: 



-- 18. Elenca tutti i professori che non hanno corsi assegnati.
-- res: 



-- 19. Visualizza i corsi con il maggior numero di studenti.
-- res: 1 (3)
SELECT c.name AS corso_piu_frequentato, COUNT(cs.student_id) AS numero_studenti
FROM course_subscription cs
JOIN course c ON cs.course_id = c.id
GROUP BY cs.course_id, c.name
ORDER BY numero_studenti 
LIMIT 1



-- 20. Trova gli studenti che sono iscritti a più di 3 corsi.
-- res: 

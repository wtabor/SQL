SELECT ES.ShowCode,ES.ShowDate, 
	COUNT(T.Seat) AS Total,
    COUNT(T.ConfirmationNo) AS Sold, 
	COUNT(T.Seat) - COUNT(T.ConfirmationNo) AS Unsold
FROM EventShow AS ES INNER JOIN Ticket AS T
ON ES.ShowCode = T.ShowCode
WHERE ShowDate >= '2015-04-21'
GROUP BY ShowCode
ORDER BY ShowDate; 

SELECT P.Director, 
	COUNT(P.EventCode) AS PlaysDirected
FROM Play AS P INNER JOIN Event AS Y
ON P.EventCode = Y.EventCode
GROUP BY P.Director;

SELECT VenueID, COUNT(ConfirmationNo) AS Sold
FROM (Event INNER JOIN EventShow on Event.EventCode = EventShow.EventCode)
INNER JOIN Ticket ON EventShow.ShowCode = Ticket.ShowCode
GROUP BY VenueID;

SELECT CONCAT(C.FirstName,", ",C.LastName) AS Name
FROM Customer AS C LEFT JOIN Ticket AS T	
ON C.HippCode = T.HippCode
WHERE ConfirmationNo is NULL
GROUP BY Name ASC;

SELECT M.EventCode, ShowDate, COUNT(ConfirmationNo) AS Sold
FROM Movie AS M, Ticket AS T, EventShow AS ES
WHERE (M.EventCode = ES.EventCode) AND (Es.ShowCode = T.ShowCode) 
GROUP BY M.EventCode
ORDER BY Sold DESC
Limit 2; 

SELECT 
	CONCAT(C.FirstName,", ",C.LastName) AS Name, 
	CONCAT(C.Street,", ",C.State," ",C.Zip) AS Address,
	COUNT(ConfirmationNo) As Sold
FROM Customer AS C, Ticket as T
WHERE C.HippCode = T.HippCode
GROUP BY C.HippCode
ORDER BY Sold DESC; 
    
 


/*SELECT EventName AS Name, Description, VenueID, Author AS 'Genre & Author'
FROM Play LEFT JOIN Event ON Event.EventCode=Play.EventCode 
UNION
SELECT EventName AS Name, Description, VenueID, Genre AS 'Genre & Author'
FROM Movie LEFT JOIN Event ON Event.EventCode=Movie.EventCode
*/
SELECT 

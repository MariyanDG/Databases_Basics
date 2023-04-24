--3. Update
/* For some of the tourist sites there are no clear records when they were established, so you need to update the column 'Establishment' for those records by putting the text '(not defined)'. */

UPDATE Sites
SET Establishment = '(not defined)'
WHERE Establishment IS NULL;

SELECT * FROM Sites;
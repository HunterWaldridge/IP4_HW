USE henry;

# 1. Retrieve first & last name of each author in the author relation:
SELECT lastName, firstName
FROM author;

# 2. Retrieve the title and book type in the book relation:
SELECT title, TYPE
FROM book;

# 3. Retrieve the publisherCode in the book relation. List each publisherCode only once in the result:
SELECT DISTINCT publisherCode
FROM book;

# 4. Retrieve the title and price of each book in the book relation. 
# Further add a calculated column named ‘discount’ that shows the price the book with 25% discount. 
# Order does not matter. Show the first five rows of the result 
SELECT title, price, price-(price*0.25) AS discount
FROM book
LIMIT 5;

# 5. Retrieve the title and price for any book whose price is higher than $20 in book relation. Show full result:
SELECT title, price
FROM book
WHERE price > 20;

# 6. Retrieve publisherName of all publishers in NY only in publisher relation:
SELECT publisherName
FROM publisher
WHERE city = "New York";

# 7. Retrieve publisherName of all publishers that are not in NY:
SELECT publisherName
FROM publisher
WHERE city != "New York";

# 8. Retrieve bookCode & onHand for each book for which a branch has between 2 & 4 copies in inventory relation.
SELECT bookCode, onHand
FROM inventory
WHERE branchNum BETWEEN 2 AND 4;

# 9. Retrieve a count of number of books published by Penguin USA. Name column 'Penguin Books':
SELECT COUNT(title) AS "Penguin Books"
FROM book
WHERE publisherCode = "PE";

# 10. Retrieve the # of books in the book relation whose prices is $20 or lower:
SELECT COUNT(title) AS "Books $20 or Lower"
FROM book
WHERE price <= 20;

# 11. Retrieve all of the columns from the book and publisher relations in one result:
SELECT *
FROM book, publisher
WHERE book.publisherCode = publisher.publisherCode;

# 12. Rewrite the previous query using the ON keyword:
SELECT *
FROM book
JOIN publisher ON
book.publisherCode = publisher.publisherCode;

# 13. Retrieve the title from the book relation and the city from the publisher relation using a JOIN query, ordered by title:
SELECT title, city
FROM book
JOIN publisher ON
book.publisherCode = publisher.publisherCode
ORDER BY book.title;

# 14. Retrieve the title from the book relation and branchNum and onHand from the inventory relation.
#  Use aliases in your query.  Order the result by title.  
SELECT title, branchNum, onHand
FROM book, inventory
ORDER BY book.title;

# 15. Retrieve the title from the book relation and compute the number of copies of the title that all branches
# have on hand. 
SELECT title, SUM(onhand) AS Inventory
FROM book, inventory
WHERE book.bookCode = inventory.bookCode
GROUP BY title;

# 16. Retrieve the first name and last name from the author relation and the title from the book
# relation for all the paperback books in the book relation. Order result by author last name and title
SELECT firstName, lastName, title 
FROM author, book 
WHERE paperback = "Y"
GROUP BY firstName, lastName, title
ORDER BY lastName, title;


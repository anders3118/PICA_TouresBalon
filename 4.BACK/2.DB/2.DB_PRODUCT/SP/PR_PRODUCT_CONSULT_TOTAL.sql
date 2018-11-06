USE [DB_PRODUCT]
GO
DROP PROCEDURE PR_PRODUCT_CONSULT_TOTAL;
GO
CREATE PROCEDURE [dbo].[PR_PRODUCT_CONSULT_TOTAL] 
		@PagNum int,
		@PagSize int
AS
BEGIN
--DECLARE 
--  @PagNum  AS INT = 3,
--  @pagesize AS INT = 40;

		SELECT *
		FROM dbo.product
		ORDER BY id, name
		OFFSET (@PagNum - 1) * @PagSize ROWS 
		FETCH NEXT @PagSize ROWS ONLY;
END;
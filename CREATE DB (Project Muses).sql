
CREATE TABLE [User_Type] (
	[T_ID] int identity(1,1) NOT NULL,
	[T_Name] nvarchar(50) NOT NULL,
	CONSTRAINT PK_UT PRIMARY KEY (T_ID),
);

CREATE TABLE [User] (
	[U_ID] int identity(1,1) NOT NULL,
	[U_Name] nvarchar(20) NOT NULL,
	[U_Join] datetime NOT NULL DEFAULT GETDATE(),
	[U_Password] nvarchar(50) NOT NULL,
	[U_Email] nvarchar(50) NOT NULL,
	[U_Type] int NOT NULL,
	[U_LastLogin] datetime DEFAULT GETDATE(),
	CONSTRAINT PK_U PRIMARY KEY (U_ID),
	CONSTRAINT FK_U_T FOREIGN KEY (U_Type) REFERENCES [User_Type](T_ID)
);

CREATE TABLE [Category] (
	[C_ID] int identity(1,1) NOT NULL,
	[C_Name] nvarchar(50) NOT NULL,
	[C_Desc] nvarchar(300) NOT NULL,
	CONSTRAINT PK_C PRIMARY KEY (C_ID)
);

CREATE TABLE [Video] (
	[V_ID] int identity(1,1) NOT NULL,
	[V_Name] nvarchar(100) NOT NULL,
	[V_Desc] nvarchar(500) NOT NULL,
	[V_Date] datetime NOT NULL DEFAULT GETDATE(),
	[V_Link] nvarchar(200) NOT NULL,
	[V_Cat] int NOT NULL,
	[V_User] int NOT NULL,
	CONSTRAINT PK_V PRIMARY KEY (V_ID),
	CONSTRAINT FK_V_C FOREIGN KEY (V_Cat) REFERENCES [Category](C_ID),
	CONSTRAINT FK_V_U FOREIGN KEY (V_User) REFERENCES [User](U_ID)
);

CREATE TABLE [Like] (
	[L_Video] int NOT NULL,
	[L_User] int NOT NULL,
	[L_Type] bit NOT NULL,
	CONSTRAINT PK_L PRIMARY KEY (L_Video, L_User),
	CONSTRAINT FK1_L_V FOREIGN KEY (L_Video) REFERENCES [Video](V_ID),
	CONSTRAINT FK2_L_U FOREIGN KEY (L_User) REFERENCES [User](U_ID)
);

CREATE TABLE [View] (
	[Vi_ID] int identity(1,1) NOT NULL,
	[Vi_Video] int NOT NULL,
	[Vi_User] int NOT NULL,
	[Vi_Date] datetime NOT NULL DEFAULT GETDATE(),
	CONSTRAINT PK_Vi PRIMARY KEY (Vi_ID),
	CONSTRAINT FK1_Vi_V FOREIGN KEY (Vi_Video) REFERENCES [Video](V_ID),
	CONSTRAINT FK2_Vi_U FOREIGN KEY (Vi_User) REFERENCES [User](U_ID)
);
GO 

CREATE TABLE [Comment] (
	[CM_ID] int identity(1,1) NOT NULL,
	[CM_User] int NOT NULL,
	[CM_Video] int NOT NULL,
	[CM_Comment] nvarchar(500) NOT NULL,
	[CM_Date] date DEFAULT GETDATE()
	CONSTRAINT PK_CM PRIMARY KEY (CM_ID),
	CONSTRAINT FK1_CM_U FOREIGN KEY (CM_User) REFERENCES [User](U_ID),
	CONSTRAINT FK2_CM_V FOREIGN KEY (CM_Video) REFERENCES [Video](V_ID)
);

CREATE PROCEDURE dbo.GetCommentOwner
 @ID		int = NULL
AS
SELECT (CM_User) FROM [Comment] WHERE (CM_User = @ID);

CREATE PROCEDURE dbo.AddComment
	@video int = NULL,
	@user	int = NULL,
	@comment nvarchar(500) = NULL
AS
INSERT INTO [Comment] (CM_Video, CM_User, CM_Comment)
VALUES
(@video, @user, @comment);
	

CREATE PROCEDURE dbo.AddLike
	@v		int = NULL,
	@u		int = NULL
AS 
INSERT INTO [Like] (L_Video, L_User)
VALUES
(@v, @u);

CREATE PROCEDURE dbo.GetRole
 @ID		int = NULL
AS
SELECT (U_Type) FROM [User] WHERE (U_ID = @ID);

CREATE PROCEDURE dbo.GetVideoOwner
 @ID		int = NULL
AS
SELECT (V_User) FROM [Video] WHERE (V_ID = @ID);

CREATE PROCEDURE dbo.AddView
 @video			int = NULL,
 @user			int = NULL
 AS
INSERT INTO [View](Vi_Video, Vi_User)
VALUES
(@video, @user)	

CREATE PROCEDURE dbo.SaveCategory
 @Name			NVARCHAR(50) = NULL,
 @Description	NVARCHAR(300) = NULL
 AS
INSERT INTO Category(C_Name, C_Desc)
VALUES
(@Name, @Description)	

CREATE PROCEDURE dbo.SaveVideo
 @Name			NVARCHAR(100) = NULL,
 @Description	NVARCHAR(500) = NULL,
 @Video		   	nvarchar(100) = NULL,
 @category				  int = NULL,
 @date				 datetime = NULL,
 @user					  int = NULL
 AS
SET @date = GETDATE();
INSERT INTO Video (V_Name, V_Desc, V_Link, V_Cat, V_Date, V_User)
VALUES
(@Name, @Description, @Video, @category, @date, @user)	

CREATE PROCEDURE [dbo].[Insert_User]
	@Username NVARCHAR(20),
	@Password NVARCHAR(50),
	@Email NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS(SELECT (U_ID) FROM [User] WHERE (U_Name) = @Username)
	BEGIN
		SELECT -1 -- Username exists.
	END
	ELSE IF EXISTS(SELECT (U_ID) FROM [User] WHERE (U_Email) = @Email)
	BEGIN
		SELECT -2 -- Email exists.
	END
	ELSE
	BEGIN
		INSERT INTO [User]
			(	[U_Name],
				[U_Password],
				[U_Email],
				[U_Type]
			)
		VALUES
			(
			   @Username,
			   @Password,
			   @Email,
			   '1'
			)
		SELECT SCOPE_IDENTITY() -- UserId			   
     END
END

GO

CREATE PROCEDURE [dbo].[Validate_User1]
      @Username NVARCHAR(20),
      @Password NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
		@UserId INT, 
		@LastLoginDate DATETIME
  
	SELECT @UserId = (U_ID), @LastLoginDate = (U_LastLogin)
	FROM [User] WHERE (U_Name) = @Username AND (U_Password) = @Password
	
	IF @UserId IS NOT NULL
		BEGIN
			UPDATE [User]
			SET U_LastLogin = GETDATE()
			WHERE U_ID = @UserId
			SELECT @UserId U_ID-- User Valid
		END
	ELSE
		BEGIN
			SELECT -2 -- User not activated.
		END
	END
    
BEGIN
	SELECT -1 -- User invalid.
END

GO

INSERT INTO [User_Type] 
VALUES
('Member'),
('Admin');

INSERT INTO [Category] (C_Name, C_Desc)
VALUES
('Around the House DIY', 'Description'),
('Arts and Craft', 'Description'),
('Arduino', 'Description'),
('Cooking', 'Description'),
('Pets', 'Description'),
('Modern Internet Phenomenon', 'Description'),
('Life Hacks', 'Description'),
('3D Printing', 'Description'),
('Environmental Friendliness', 'Description'),
('Gardening', 'Description');

USE [master]
GO
/****** Object:  Database [project_Ecommerce]    Script Date: 8/22/2023 1:01:13 PM ******/
CREATE DATABASE [project_Ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project_Ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_Ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project_Ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\project_Ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [project_Ecommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project_Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project_Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project_Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project_Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project_Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project_Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [project_Ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project_Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project_Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project_Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project_Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project_Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project_Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project_Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project_Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project_Ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project_Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project_Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project_Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project_Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project_Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project_Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project_Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project_Ecommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [project_Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [project_Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project_Ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project_Ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project_Ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project_Ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [project_Ecommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [project_Ecommerce] SET QUERY_STORE = OFF
GO
USE [project_Ecommerce]
GO
/****** Object:  UserDefinedFunction [dbo].[getdiscount]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE function [dbo].[getdiscount](@mrp int,@salerate int)
  returns int
  as
  begin
	declare @discount int=0;
	set @discount=((@mrp-@salerate)*100)/@mrp
	return @discount
  end
GO
/****** Object:  Table [dbo].[tbl_cartitem]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cartitem](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [varchar](150) NULL,
	[quantity] [int] NULL,
	[cart_date] [datetime] NULL,
 CONSTRAINT [PK_tbl_cartitem] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](150) NULL,
	[cat_icon] [varchar](150) NULL,
	[cat_status] [bit] NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_orderdetail]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_orderdetail](
	[order_id] [int] IDENTITY(100001,1) NOT NULL,
	[user_id] [varchar](150) NULL,
	[order_date] [datetime] NULL,
	[total_amount] [int] NULL,
	[payment_mode] [varchar](100) NULL,
	[payment_status] [varchar](50) NULL,
	[out_to_delivery_status] [date] NULL,
	[delivered] [date] NULL,
	[order_status] [bit] NULL,
 CONSTRAINT [PK_tbl_orderdetail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_orderproduct]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_orderproduct](
	[sr] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_tbl_orderproduct] PRIMARY KEY CLUSTERED 
(
	[sr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](150) NULL,
	[cat_id] [int] NULL,
	[subcat_id] [int] NULL,
	[dec] [text] NULL,
	[mrp] [int] NULL,
	[salerate] [int] NULL,
	[brand] [varchar](150) NULL,
	[product_icon] [varchar](150) NULL,
	[status] [bit] NULL,
	[p_date] [date] NULL,
 CONSTRAINT [PK_tbl_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_registration]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_registration](
	[sr] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](150) NULL,
	[email] [varchar](150) NULL,
	[mobno] [varchar](150) NOT NULL,
	[pass] [varchar](150) NULL,
	[address] [varchar](250) NULL,
	[pincode] [int] NULL,
	[landmark] [varchar](150) NULL,
	[user_pic] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[mobno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_subcategory]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subcategory](
	[subcat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [int] NULL,
	[subcat_name] [varchar](150) NULL,
	[subcat_icon] [varchar](150) NULL,
	[subcat_status] [bit] NULL,
 CONSTRAINT [PK_tbl_subcategory] PRIMARY KEY CLUSTERED 
(
	[subcat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_cartitem] ON 

INSERT [dbo].[tbl_cartitem] ([cart_id], [product_id], [user_id], [quantity], [cart_date]) VALUES (6, 15, N'9140444301', 3, CAST(N'2023-08-17T09:59:19.033' AS DateTime))
INSERT [dbo].[tbl_cartitem] ([cart_id], [product_id], [user_id], [quantity], [cart_date]) VALUES (1029, 14, N'7234854102', 1, CAST(N'2023-08-20T14:17:03.437' AS DateTime))
INSERT [dbo].[tbl_cartitem] ([cart_id], [product_id], [user_id], [quantity], [cart_date]) VALUES (1030, 13, N'7234854102', 1, CAST(N'2023-08-21T08:20:22.513' AS DateTime))
INSERT [dbo].[tbl_cartitem] ([cart_id], [product_id], [user_id], [quantity], [cart_date]) VALUES (1031, 10, N'7234854102', 2, CAST(N'2023-08-21T14:48:37.467' AS DateTime))
INSERT [dbo].[tbl_cartitem] ([cart_id], [product_id], [user_id], [quantity], [cart_date]) VALUES (1032, 16, N'7234854102', 1, CAST(N'2023-08-21T14:48:39.547' AS DateTime))
INSERT [dbo].[tbl_cartitem] ([cart_id], [product_id], [user_id], [quantity], [cart_date]) VALUES (1033, 11, N'7234854102', 2, CAST(N'2023-08-21T14:48:43.963' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_cartitem] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_icon], [cat_status]) VALUES (9, N'Vegetables & Fruit', N'vegetable.svg', 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_icon], [cat_status]) VALUES (10, N'Breakfast', N'breakfast.svg', 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_icon], [cat_status]) VALUES (11, N'Beverages', N'cup.svg', 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_icon], [cat_status]) VALUES (12, N'Biscuits & Snacks', N'biscuit.svg', 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_icon], [cat_status]) VALUES (13, N'Grocery & Staples', N'grocery.svg', 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_icon], [cat_status]) VALUES (14, N'Pet Food', N'pet.svg', 1)
INSERT [dbo].[tbl_category] ([cat_id], [cat_name], [cat_icon], [cat_status]) VALUES (15, N'Milk & Dairies', N'milk.svg', 1)
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (8, N'Sprite', 11, 12, N'<p>Soft Drink</p>
', 40, 35, N'coca cola', N'sprite.jpg', NULL, CAST(N'2023-08-11' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (9, N'Aashirvaad Atta', 13, 19, N'<p>Aashirvaad Atta with Multigrains is high in fibre &amp; helps digestion.<br />
3 rotis fulfill 35% of your daily fibre requirement.<br />
The rotis taste just like your regular atta.<br />
It&#39;s a blend of 6 grains &ndash; wheat, maize, soya, channa, oats, psyllium husk.<br />
Make tasty rotis &amp; never miss your daily dose of fibre.</p>

<p><em>Shelf Life</em></p>

<p><em><strong>3 months</strong></em></p>

<p><em><strong>Unit</strong></em></p>

<p><em><strong>5 kg</strong></em></p>

<p><em><strong>Ingredients</strong></em></p>

<p>Whole Wheat Atta (90.9%), Multigrain Flour Mixture (9.1%) (Defatted Soya Flour, Psyllium Husk Powder, Maize Flour and Bengal Gram Flour)</p>

<p><strong>Manufacturer Details</strong></p>

<p>ITC Limited, 37, J.L. Nehru Road, Kolkata- 700071</p>

<p><strong>Marketed By</strong></p>

<p>ITC Limited, 37, J.L. Nehru Road, Kolkata-</p>
', 350, 301, N'Aashirvaad ', N'grosery.jpg', NULL, CAST(N'2023-08-11' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (10, N'Hide & Seek Chocolate Chip Cookies (Milano Collections)', 12, 14, N'<p><strong>Key Features</strong></p>

<p>Unbelievably and mysteriously luxurious.<br />
A wonderful hint of these cookies and chocolate is yummy, tasty, ready and crunchy.<br />
Melts in your mouth.</p>

<p><em>Unit</em></p>

<p>150 g</p>

<p><strong>Packaging Type</strong></p>

<p>Packet</p>

<p>Shelf Life</p>

<p><strong>7 Months</strong></p>

<p><strong>FSSAI License</strong></p>

<p><strong>10013022002253</strong></p>

<p><strong>Country Of Origin</strong></p>

<p><strong>India</strong></p>
', 120, 60, N'Parle', N'cookies.jpg', NULL, CAST(N'2023-08-11' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (11, N'Nestle Maggi Cup Noodles', 10, 18, N'<p><strong>Key Features</strong></p>

<p>Cup noodles combining delicious taste of Maggi and on-the-go convenience<br />
Your favourite Maggi taste already added to the noodles for quick preparation<br />
Ready in just 4 minutes, perfect for anywhere, anytime hunger pangs<br />
Contains a fork inside for maximum convenience, no matter where you are</p>

<p><strong>Ingredients</strong></p>

<p>NOODLES: Refined wheat flour (Maida), Palm oil, Iodised salt, Mineral (calcium Carbonate), Thickners (412 &amp; 508), Humectant (451(i)) and Acidity regulators (501(i), 500 (i)) &amp; 330).<br />
<strong>INGREDIENTS</strong><br />
Mixed spices {(3Z 3%j (onion (6.861), Garlic powder (4.2%), Red chilli powder (3.9%), Cumin powder, Coriander powder, Turmeric powder, Ginger powder, Dehydrated coriander leaves, Nutmeg powder, Aniseed powder, Black pepper powder, Dehy-drated kasuri methi leaves, Fenugreek powder, Mace powder, Clove powder &amp; Green cardamom powder) Sugar, Satt, Noodle powder (Refined wheat flour (Maida), Palm oil, Salt, Wheat gulten, Mineral (Calci-um carbonat), Thickeners (508 &amp; 412), Acidity regula-tors (501(i) &amp; 500(i)) &amp; Humectant (451(i))), Dehydrat-ed carrot flakes (6.4%), Dehydrated tomato paste solids (Tomato paste, Anticaking agent (551) &amp; Salt), Edible starch, Dehydrated Green peas (5.6%), Edible vegetable oil (Palm oil &amp; Corn oil), Thickener (508), Yeast extract, Flavour enhancer (635), Tamarind powder, Acidity regulator (330), Celery, Milk Sesame and Soybean.</p>

<p><strong>Unit</strong></p>

<p>70.5 g</p>
', 60, 50, N'Maggi', N'noodels.jpg', NULL, CAST(N'2023-08-11' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (12, N'Potato', 9, 17, N'<p><strong>Good for health</strong></p>
', 50, 40, N'Vegetable', N'vegitable.jpg', NULL, CAST(N'2023-08-11' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (13, N'Drools Chicken & Egg Dog Dry Food (Puppy)', 14, 16, N'<p><strong>Key Features</strong></p>

<p>Inhance calcium density in bone.<br />
Supports skin health.<br />
Promotes appetite satisfaction.</p>

<p><strong>Ingredients</strong></p>

<p>Chicken, Whole Dried Eggs, Corn, Rice, Wheat, Corn Gluten Meal, Fish Oil, Soya Refined Oil, Corn Oil, Lecithin, Essential Amino Acids, Minerals, Vitamins, Salt and Antioxidants.</p>

<p><strong>Unit</strong></p>

<p>1.2 kg</p>
', 299, 276, N'Drools Pet ', N'petfood.jpg', NULL, CAST(N'2023-08-12' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (14, N'Amul Milk Gold', 15, 15, N'<p>good for health</p>
', 50, 40, N'Amul', N'amul.jpg', NULL, CAST(N'2023-08-12' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (15, N'lassi', 15, 15, N'<p>good for health</p>
', 90, 60, N'amul', N'lassi.jpg', NULL, CAST(N'2023-08-12' AS Date))
INSERT [dbo].[tbl_product] ([product_id], [product_name], [cat_id], [subcat_id], [dec], [mrp], [salerate], [brand], [product_icon], [status], [p_date]) VALUES (16, N'Cadbury Oreo Biscuit Vanilla Flavour Cream Sandwich', 12, 14, N'<p><strong>Description</strong></p>

<p>OREO: milk&#39;s best friend for over 100 years! Cadbury OREO?Vanilla?creme sandwich biscuit consists of two chocolatey biscuits with a rich?vanilla?creme filling between them. Cadbury?OREO creme biscuits are made with cocoa, which defines their unique chocolatey flavour. Add this crunchy delight to your snacks and gift yourself rich and smooth joy. OREO biscuits are perfect for snacking or enjoying as a treat at any time of the day. Twist, lick and dunk! Enjoy OREO sandwich cookies with a glass of milk or add them to your favourite recipes such as cakes and milkshakes! Add a scoop of vanilla ice cream to OREO biscuits to make your own creamy dessert! Available in single &amp; family/ combo packs.</p>

<p>General</p>

<table>
	<tbody>
		<tr>
			<td>Brand</td>
			<td>
			<ul>
				<li>Cadbury Oreo</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Model Name</td>
			<td>
			<ul>
				<li>Biscuit Vanilla Flavour</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Quantity</td>
			<td>
			<ul>
				<li>43.75 g</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Type</td>
			<td>
			<ul>
				<li>Cream Sandwich</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Base Flavors</td>
			<td>
			<ul>
				<li>Vanilla</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Organic</td>
			<td>
			<ul>
				<li>No</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Ingredients</td>
			<td>
			<ul>
				<li>Refined Wheat Flour, Sugar, Edible Vegetable Fat, Palmolein Oil, Invert Syrup, Cocoa Solids, Leavening Agents, Edible Salt</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Food Preference</td>
			<td>
			<ul>
				<li>Vegetarian</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Container Type</td>
			<td>
			<ul>
				<li>Pouch</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Maximum Shelf Life</td>
			<td>
			<ul>
				<li>6 Months</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>nutrient Content</td>
			<td>
			<ul>
				<li>NA</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>EAN</td>
			<td>
			<ul>
				<li>8901233013091, 7622201428501, 7622201756697, 8901233017730, 8901233018980, 8901233031026</li>
			</ul>
			</td>
		</tr>
		<tr>
			<td>Net Quantity</td>
			<td>
			<ul>
				<li>43.75 g</li>
			</ul>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>
', 50, 40, N'Oreo', N'oreo.jpg', NULL, CAST(N'2023-08-14' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_registration] ON 

INSERT [dbo].[tbl_registration] ([sr], [name], [email], [mobno], [pass], [address], [pincode], [landmark], [user_pic]) VALUES (1, N'Ram', N'ram@gamil.com', N'7234854102', N'123', N'Plot no 43 Vikas nagar Lucknow', 226022, N'RoyalEnfield chok near reliance mall', N'Ram-1.jpg')
INSERT [dbo].[tbl_registration] ([sr], [name], [email], [mobno], [pass], [address], [pincode], [landmark], [user_pic]) VALUES (1002, N'Ram', N'jaferabbas786@gmail.com', N'786', N'123', N'Techpile Lucknow', 226022, N'Near HP', N'1677072219404.jpg')
INSERT [dbo].[tbl_registration] ([sr], [name], [email], [mobno], [pass], [address], [pincode], [landmark], [user_pic]) VALUES (2, N'Divya', N'divya@gmail.com', N'9140444301', N'1', N'Plot no 43 first floor sector 5 vikas nagar lucknow', 226022, N'near H.P Petrol pump', N'noodels.jpg')
SET IDENTITY_INSERT [dbo].[tbl_registration] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_subcategory] ON 

INSERT [dbo].[tbl_subcategory] ([subcat_id], [cat_id], [subcat_name], [subcat_icon], [subcat_status]) VALUES (12, 11, N'Soft Drink', N'sprite.jpg', 1)
INSERT [dbo].[tbl_subcategory] ([subcat_id], [cat_id], [subcat_name], [subcat_icon], [subcat_status]) VALUES (14, 12, N'Cookies', N'cookies.jpg', 1)
INSERT [dbo].[tbl_subcategory] ([subcat_id], [cat_id], [subcat_name], [subcat_icon], [subcat_status]) VALUES (15, 15, N'Milk', N'amul.jpg', 1)
INSERT [dbo].[tbl_subcategory] ([subcat_id], [cat_id], [subcat_name], [subcat_icon], [subcat_status]) VALUES (16, 14, N'Dog Food', N'petfood.jpg', 1)
INSERT [dbo].[tbl_subcategory] ([subcat_id], [cat_id], [subcat_name], [subcat_icon], [subcat_status]) VALUES (17, 9, N'Fresh Vegetables', N'vegitable.jpg', 1)
INSERT [dbo].[tbl_subcategory] ([subcat_id], [cat_id], [subcat_name], [subcat_icon], [subcat_status]) VALUES (18, 10, N'Noodles', N'noodels.jpg', 1)
INSERT [dbo].[tbl_subcategory] ([subcat_id], [cat_id], [subcat_name], [subcat_icon], [subcat_status]) VALUES (19, 13, N'Atta', N'grosery.jpg', 1)
SET IDENTITY_INSERT [dbo].[tbl_subcategory] OFF
GO
ALTER TABLE [dbo].[tbl_cartitem]  WITH CHECK ADD  CONSTRAINT [FK_tbl_cartitem_tbl_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_cartitem] CHECK CONSTRAINT [FK_tbl_cartitem_tbl_product]
GO
ALTER TABLE [dbo].[tbl_cartitem]  WITH CHECK ADD  CONSTRAINT [FK_tbl_cartitem_tbl_registration] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_registration] ([mobno])
GO
ALTER TABLE [dbo].[tbl_cartitem] CHECK CONSTRAINT [FK_tbl_cartitem_tbl_registration]
GO
ALTER TABLE [dbo].[tbl_orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderdetail_tbl_registration] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_registration] ([mobno])
GO
ALTER TABLE [dbo].[tbl_orderdetail] CHECK CONSTRAINT [FK_tbl_orderdetail_tbl_registration]
GO
ALTER TABLE [dbo].[tbl_orderproduct]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderproduct_tbl_orderdetail] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_orderdetail] ([order_id])
GO
ALTER TABLE [dbo].[tbl_orderproduct] CHECK CONSTRAINT [FK_tbl_orderproduct_tbl_orderdetail]
GO
ALTER TABLE [dbo].[tbl_orderproduct]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderproduct_tbl_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_product] ([product_id])
GO
ALTER TABLE [dbo].[tbl_orderproduct] CHECK CONSTRAINT [FK_tbl_orderproduct_tbl_product]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK__tbl_produ__cat_i__2D27B809] FOREIGN KEY([cat_id])
REFERENCES [dbo].[tbl_category] ([cat_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK__tbl_produ__cat_i__2D27B809]
GO
ALTER TABLE [dbo].[tbl_subcategory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_subcategory_tbl_category] FOREIGN KEY([cat_id])
REFERENCES [dbo].[tbl_category] ([cat_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_subcategory] CHECK CONSTRAINT [FK_tbl_subcategory_tbl_category]
GO
/****** Object:  StoredProcedure [dbo].[sp_cartitem]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_cartitem]
@product_id int =0,
@user_id varchar(150)=null,
@quantity int=0,
@cart_date date=null,
@action int =0 
as
begin
			if @action=1
			begin
				if(@quantity=0)
				begin
					delete from tbl_cartitem where product_id=@product_id and user_id=@user_id
				end
				else
				begin

					if not exists (select * from tbl_cartitem where product_id=@product_id and user_id=@user_id)
					begin
						insert into tbl_cartitem (product_id,user_id,quantity,cart_date) values (@product_id,@user_id,@quantity,GETDATE())
					end

					else
					begin
						update tbl_cartitem set quantity=@quantity where product_id=@product_id and user_id=@user_id
					end
				end
			end

			-- select total item added in cart by a user --
			--if @action=2
			--begin
			--select ISNULL(sum(quantity),0) as 'Total' from tbl_cartitem where user_id=@user_id
			--end


			if @action=2
			begin
			select isnull(sum(c.quantity),0) as 'quantity',isnull(sum( p.salerate*c.quantity),0) as 'Total' from  tbl_cartitem c left join tbl_product p on p.product_id =c.product_id
				where c.user_id =@user_id
			end

			if(@action=3)
			begin
			select p.*,c.quantity,p.salerate*c.quantity as 'Total',cat.cat_name from tbl_cartitem c left join tbl_product p on p.product_id=c.product_id
			left join tbl_category cat on p.cat_id=cat.cat_id
			where c.user_id=@user_id
			end
end





GO
/****** Object:  StoredProcedure [dbo].[sp_category]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_category]
@cat_id int=0,
@cat_name varchar(150)=null,
@cat_icon varchar(150)=null,
@cat_status bit=1,
@action int =0
as
begin
			if @action=1
			begin
				if not exists(select* from tbl_category where cat_name=@cat_name)
				 begin

					insert into tbl_category values(@cat_name,@cat_icon,@cat_status)
					select 'category added in database'
				end

					else
					begin
						select 'category already exists '
					end
			end

			if @action=2
			begin
				
						select * from tbl_category where cat_status =1 order		 by cat_name
			end


			if @action=3
			begin
			select * from tbl_category
			end

			if @action=4
			begin
			delete from tbl_category where cat_id=@cat_id
			end

			if @action=5
			begin
			select * from tbl_category where cat_id=@cat_id
			end

			if @action=6
			begin
			update tbl_category set cat_name=@cat_name,cat_icon=@cat_icon where cat_id=@cat_id
			end

			if @action=7
			begin
			update tbl_category set cat_name=@cat_name where cat_id=@cat_id
			end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_login]
@mobno varchar(150)=null,
@pass varchar(150)=null
as
begin
		select * from tbl_registration where mobno=@mobno and pass=@pass

end
GO
/****** Object:  StoredProcedure [dbo].[sp_product]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_product]

@product_id int =0,
@product_name varchar(150)=null,
@cat_id int =0,
@subcat_id int =0,
@dec text=null,
@mrp varchar(100)=null,
@salerate varchar(100)=null,
@brand varchar(150)=null,
@product_icon varchar(150)=null,
@status bit=1,
@p_date date=null,
@user_id varchar(100)=null,
@action int =0
as
begin 
			if @action=1
			begin
				if not exists(select* from tbl_product where product_name=@product_name)
				 begin

					insert into tbl_product(product_name,cat_id,subcat_id,dec,mrp,salerate,brand,product_icon,p_date) values(@product_name,@cat_id,@subcat_id,@dec,@mrp,@salerate,@brand,@product_icon,GETDATE())
					select 'Product added in database'
				end
			
					else
					begin
						select 'Product already exists '
					end
			end

			if @action=3
			begin
			select tbl_product.* ,tbl_subcategory.subcat_name,tbl_category.cat_name from tbl_product left join tbl_subcategory on tbl_subcategory.subcat_id=tbl_product.subcat_id left join tbl_category on tbl_category.cat_id = tbl_product.cat_id 
			end

			if @action=4
			begin
			delete from tbl_product where product_id=@product_id
			end

			if @action=5
			begin
			select tbl_product.* ,tbl_subcategory.subcat_name,tbl_category.cat_name from tbl_product left join tbl_subcategory on tbl_subcategory.subcat_id=tbl_product.subcat_id left join tbl_category on tbl_category.cat_id = tbl_product.cat_id  where product_id=@product_id
			end

			if @action=6
			begin
				select top 12 p.*,dbo.getdiscount(p.mrp,p.salerate) as 'per_discount',c.quantity from tbl_product p left join tbl_cartitem c on p.product_id=c.product_id and c.user_id=@user_id
				 order by per_discount desc 
			end

			if(@action=7)
			begin
					select p.*,dbo.getdiscount(p.mrp,p.salerate) as 'per_discount',c.quantity from tbl_product p left join tbl_cartitem c on p.product_id=c.product_id and c.user_id=@user_id where p.cat_id=@cat_id
			end
	end



GO
/****** Object:  StoredProcedure [dbo].[sp_reg]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_reg]
@sr int=0,
@name varchar(150)=null,
@email varchar(150)=null,
@mobno varchar(150)=null,
@pass varchar(150)=null,
@address varchar(250)=null,
@pincode int=0,
@landmark varchar(150)=null,
@user_pic varchar(150)=null,
@action int =0
as
begin
		if @action=1
			begin
				if not exists(select* from tbl_registration where mobno=@mobno)
				 begin

					insert into tbl_registration values(@name,@email,@mobno,@pass,@address,@pincode,@landmark,@user_pic)
					select 'Account Created'
				end

					else
					begin
						select 'YOU Are already Registred '
					end
			end

			if @action=2
			begin
			select * from tbl_registration where mobno=@mobno
			end

			if @action=3
			begin
			update tbl_registration set address=@address,pincode=@pincode,landmark=@landmark where mobno=@mobno
			end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_subcategory]    Script Date: 8/22/2023 1:01:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_subcategory]
@cat_id int=0,
@subcat_id int=0,
@subcat_name varchar(150)=null,
@subcat_icon varchar(150)=null,
@subcat_status bit=1,
@action int =0
as
begin
			if @action=1
			begin
				if not exists(select* from tbl_subcategory where subcat_name=@subcat_name)
				 begin

					insert into tbl_subcategory values(@cat_id,@subcat_name,@subcat_icon,@subcat_status);
					select 'sub category added in database'
				end

					else
					begin
						select ' sub category already exists '
					end
			end

			if @action=2
			begin
				
						select * from tbl_subcategory where subcat_status =1 order		 by subcat_name
			end

			if @action=3
			begin
			select * from tbl_subcategory where cat_id=@cat_id order by subcat_name
			end

			if @action=4
			begin
			select tbl_subcategory.* ,tbl_category.cat_name from tbl_subcategory left join tbl_category on tbl_category.cat_id=tbl_subcategory.cat_id
			end

			if @action=5
			begin
			delete from tbl_subcategory where subcat_id=@subcat_id
			end

			if @action=6
			begin
			select * from tbl_subcategory where subcat_id=@subcat_id
			end


			if @action=7
			begin
			update tbl_subcategory set subcat_name=@subcat_name,subcat_icon=@subcat_icon ,cat_id=@cat_id where subcat_id=@subcat_id
			end

			if @action=8
			begin
			update tbl_subcategory set subcat_name=@subcat_name, cat_id=@cat_id  where subcat_id=@subcat_id
			end


end
GO
USE [master]
GO
ALTER DATABASE [project_Ecommerce] SET  READ_WRITE 
GO

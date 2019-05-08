USE [MillennialResort_DB]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 5/8/2019 6:21:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] IDENTITY(100000,1) NOT NULL,
	[AppointmentTypeID] [nvarchar](15) NOT NULL,
	[GuestID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [pk_AppointmentID] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentType]    Script Date: 5/8/2019 6:21:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentType](
	[AppointmentTypeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_AppointmentTypeID] PRIMARY KEY CLUSTERED 
(
	[AppointmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 5/8/2019 6:21:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[BuildingName] [nvarchar](150) NULL,
	[Address] [nvarchar](150) NULL,
	[BuildingStatusID] [nvarchar](25) NOT NULL,
	[ResortPropertyID] [int] NOT NULL,
 CONSTRAINT [pk_BuildingID] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildingStatus]    Script Date: 5/8/2019 6:21:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildingStatus](
	[BuildingStatusID] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_BuildingStatusID] PRIMARY KEY CLUSTERED 
(
	[BuildingStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [pk_DepartmentID] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(100000,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[PasswordHash] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
	[DepartmentID] [nvarchar](50) NULL,
 CONSTRAINT [pk_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ak_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRole]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRole](
	[EmployeeID] [int] NOT NULL,
	[RoleID] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_EmployeeID_RoleID] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(100000,1) NOT NULL,
	[OfferingID] [int] NOT NULL,
	[EventTitle] [nvarchar](50) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EventTypeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[EventStartDate] [date] NOT NULL,
	[EventEndDate] [date] NOT NULL,
	[KidsAllowed] [bit] NOT NULL,
	[NumGuests] [int] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Sponsored] [bit] NOT NULL,
	[Approved] [bit] NOT NULL,
	[Cancelled] [bit] NOT NULL,
	[SeatsRemaining] [int] NOT NULL,
	[PublicEvent] [bit] NOT NULL,
 CONSTRAINT [pk_EventID] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventEmployee]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventEmployee](
	[EventID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [pk_EventID_EmployeeID] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventPerformance]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPerformance](
	[EventID] [int] NOT NULL,
	[PerformanceID] [int] NOT NULL,
 CONSTRAINT [pk_EventID_PerformanceID] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[PerformanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSponsor]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSponsor](
	[EventID] [int] NOT NULL,
	[SponsorID] [int] NOT NULL,
 CONSTRAINT [pk_EventID_SponsorID] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC,
	[SponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
	[EventTypeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_EventTypeID] PRIMARY KEY CLUSTERED 
(
	[EventTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestID] [int] IDENTITY(100000,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[GuestTypeID] [nvarchar](25) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Minor] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[ReceiveTexts] [bit] NOT NULL,
	[EmergencyFirstName] [nvarchar](50) NOT NULL,
	[EmergencyLastName] [nvarchar](100) NOT NULL,
	[EmergencyPhoneNumber] [nvarchar](11) NOT NULL,
	[EmergencyRelation] [nvarchar](25) NOT NULL,
	[CheckedIn] [bit] NOT NULL,
 CONSTRAINT [pk_GuestID] PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uk_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestRoomAssignment]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestRoomAssignment](
	[GuestID] [int] NOT NULL,
	[RoomReservationID] [int] NOT NULL,
	[CheckinDate] [datetime] NULL,
	[CheckoutDate] [datetime] NULL,
 CONSTRAINT [pk_GuestID_RoomReservationID] PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC,
	[RoomReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestType](
	[GuestTypeID] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_GuestTypeID] PRIMARY KEY CLUSTERED 
(
	[GuestTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestVehicle]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestVehicle](
	[GuestID] [int] NOT NULL,
	[Make] [nvarchar](30) NOT NULL,
	[Model] [nvarchar](30) NOT NULL,
	[PlateNumber] [nvarchar](10) NOT NULL,
	[Color] [nvarchar](30) NULL,
	[ParkingLocation] [nvarchar](50) NULL,
 CONSTRAINT [pk_Make_Model_PlateNumber] PRIMARY KEY CLUSTERED 
(
	[Make] ASC,
	[Model] ASC,
	[PlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HouseKeepingRequest]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HouseKeepingRequest](
	[HouseKeepingRequestID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingNumber] [int] NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[WorkingEmployeeID] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_HouseKeepingRequestID] PRIMARY KEY CLUSTERED 
(
	[HouseKeepingRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspection]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspection](
	[InspectionID] [int] IDENTITY(100000,1) NOT NULL,
	[ResortPropertyID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DateInspected] [date] NOT NULL,
	[Rating] [nvarchar](50) NOT NULL,
	[ResortInspectionAffiliation] [nvarchar](25) NULL,
	[InspectionProblemNotes] [nvarchar](1000) NULL,
	[InspectionFixNotes] [nvarchar](1000) NULL,
 CONSTRAINT [pk_InspectionID] PRIMARY KEY CLUSTERED 
(
	[InspectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternalOrder]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalOrder](
	[InternalOrderID] [int] IDENTITY(100000,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[OrderComplete] [bit] NOT NULL,
	[DateOrdered] [datetime] NOT NULL,
 CONSTRAINT [pk_InternalOrderID] PRIMARY KEY CLUSTERED 
(
	[InternalOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InternalOrderLine]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InternalOrderLine](
	[ItemID] [int] NOT NULL,
	[InternalOrderID] [int] NOT NULL,
	[OrderQty] [int] NOT NULL,
	[QtyReceived] [int] NOT NULL,
	[PickSheetID] [nvarchar](25) NULL,
	[OrderReceivedDate] [datetime] NULL,
	[PickCompleteDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[OrderStatus] [int] NOT NULL,
	[OutOfStock] [bit] NOT NULL,
 CONSTRAINT [pk_ItemID_InternalOrderID] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[InternalOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [int] IDENTITY(100000,1) NOT NULL,
	[ItemTypeID] [nvarchar](15) NOT NULL,
	[OfferingID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateActive] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
	[OnHandQty] [int] NOT NULL,
	[ReorderQty] [int] NOT NULL,
	[CustomerPurchasable] [bit] NOT NULL,
	[RecipeID] [int] NULL,
 CONSTRAINT [pk_ItemID] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSupplier]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSupplier](
	[ItemID] [int] NOT NULL,
	[SupplierItemID] [int] NULL,
	[SupplierID] [int] NOT NULL,
	[PrimarySupplier] [bit] NULL,
	[LeadTimeDays] [int] NULL,
	[UnitPrice] [money] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_ItemID_ItemID] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[ItemTypeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_ItemTypeID] PRIMARY KEY CLUSTERED 
(
	[ItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Luggage]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Luggage](
	[LuggageID] [int] IDENTITY(100000,1) NOT NULL,
	[GuestID] [int] NOT NULL,
	[LuggageStatusID] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_LuggageID] PRIMARY KEY CLUSTERED 
(
	[LuggageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuggageStatus]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuggageStatus](
	[LuggageStatusID] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_LuggageStatusID] PRIMARY KEY CLUSTERED 
(
	[LuggageStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceStatus]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceStatus](
	[MaintenanceStatusID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_MaintenanceStatusID] PRIMARY KEY CLUSTERED 
(
	[MaintenanceStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceType](
	[MaintenanceTypeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_MaintenanceTypeID] PRIMARY KEY CLUSTERED 
(
	[MaintenanceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceWorkOrder]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceWorkOrder](
	[MaintenanceWorkOrderID] [int] IDENTITY(100000,1) NOT NULL,
	[MaintenanceTypeID] [nvarchar](15) NOT NULL,
	[DateRequested] [date] NOT NULL,
	[DateCompleted] [date] NULL,
	[RequestingEmployeeID] [int] NOT NULL,
	[WorkingEmployeeID] [int] NULL,
	[Complete] [bit] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Comments] [nvarchar](1000) NULL,
	[MaintenanceStatus] [nvarchar](50) NOT NULL,
	[ResortPropertyID] [int] NULL,
 CONSTRAINT [pk_MaintenanceWorkOrderID] PRIMARY KEY CLUSTERED 
(
	[MaintenanceWorkOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(100000,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[PasswordHash] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [pk_MemberID] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberTab]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTab](
	[MemberTabID] [int] IDENTITY(100000,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[TotalPrice] [money] NOT NULL,
 CONSTRAINT [pk_MemberTab] PRIMARY KEY CLUSTERED 
(
	[MemberTabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberTabLine]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTabLine](
	[MemberTabLineID] [int] IDENTITY(100000,1) NOT NULL,
	[MemberTabID] [int] NOT NULL,
	[OfferingID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[EmployeeID] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[GuestID] [int] NULL,
	[DatePurchased] [datetime] NULL,
 CONSTRAINT [pk_MemberTabLineID] PRIMARY KEY CLUSTERED 
(
	[MemberTabLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1000000,1) NOT NULL,
	[SenderEmail] [nvarchar](250) NOT NULL,
	[DateTimeSent] [datetime] NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Body] [nvarchar](1000) NOT NULL,
	[ThreadID] [int] NOT NULL,
 CONSTRAINT [pk_MessageID] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageThread]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageThread](
	[ThreadID] [int] IDENTITY(100,1) NOT NULL,
	[FirstMessage] [int] NULL,
	[Archived] [bit] NOT NULL,
 CONSTRAINT [pk_MessageThreadID] PRIMARY KEY CLUSTERED 
(
	[ThreadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offering]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offering](
	[OfferingID] [int] IDENTITY(100000,1) NOT NULL,
	[OfferingTypeID] [nvarchar](15) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Price] [money] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_OfferingID] PRIMARY KEY CLUSTERED 
(
	[OfferingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfferingType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfferingType](
	[OfferingTypeID] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_OfferingTypeID] PRIMARY KEY CLUSTERED 
(
	[OfferingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Performance]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performance](
	[PerformanceID] [int] IDENTITY(100000,1) NOT NULL,
	[PerformanceDate] [date] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[PerformanceTitle] [nvarchar](100) NULL,
	[Cancelled] [bit] NOT NULL,
 CONSTRAINT [pk_PerformanceID] PRIMARY KEY CLUSTERED 
(
	[PerformanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[PetID] [int] IDENTITY(100000,1) NOT NULL,
	[GuestID] [int] NOT NULL,
	[PetTypeID] [nvarchar](25) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[PetName] [nvarchar](50) NOT NULL,
	[Species] [nvarchar](50) NOT NULL,
	[PetPicture] [varbinary](max) NULL,
 CONSTRAINT [pk_PetID] PRIMARY KEY CLUSTERED 
(
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetImageFileName]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetImageFileName](
	[Filename] [nvarchar](255) NOT NULL,
	[PetID] [int] NOT NULL,
 CONSTRAINT [pk_Filename] PRIMARY KEY CLUSTERED 
(
	[Filename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetType](
	[PetTypeID] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_PetTypeID] PRIMARY KEY CLUSTERED 
(
	[PetTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickSheet]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickSheet](
	[PickSheetID] [nvarchar](25) NOT NULL,
	[PickSheetCreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[PickCompletedBy] [int] NULL,
	[PickCompletedDate] [datetime] NULL,
	[PickDeliveredBy] [int] NULL,
	[PickDeliveryDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[NumberOfOrders] [int] NULL,
	[PickSheetNumber] [int] NOT NULL,
 CONSTRAINT [pk_PickSheet_PickSheetID] PRIMARY KEY CLUSTERED 
(
	[PickSheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receiving]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receiving](
	[ReceivingID] [int] IDENTITY(100000,1) NOT NULL,
	[SupplierOrderID] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[DateDelivered] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_ReceivingID] PRIMARY KEY CLUSTERED 
(
	[ReceivingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[RecipeID] [int] IDENTITY(100000,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DateAdded] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_RecipeID] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipeItemLine]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeItemLine](
	[RecipeID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [decimal](10, 4) NOT NULL,
	[UnitOfMeasure] [nvarchar](25) NOT NULL,
 CONSTRAINT [pk_RecipeID_ItemID] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationID] [int] IDENTITY(100000,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[NumberOfGuests] [int] NOT NULL,
	[NumberOfPets] [int] NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_ReservationID] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResortProperty]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResortProperty](
	[ResortPropertyID] [int] IDENTITY(100000,1) NOT NULL,
	[ResortPropertyTypeID] [nvarchar](20) NOT NULL,
 CONSTRAINT [pk_ResortPropertyID] PRIMARY KEY CLUSTERED 
(
	[ResortPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResortPropertyType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResortPropertyType](
	[ResortPropertyTypeID] [nvarchar](20) NOT NULL,
 CONSTRAINT [pk_ResortPropertyTypeID] PRIMARY KEY CLUSTERED 
(
	[ResortPropertyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResortVehicle]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResortVehicle](
	[VehicleID] [int] IDENTITY(100000,1) NOT NULL,
	[Make] [nvarchar](30) NOT NULL,
	[Model] [nvarchar](30) NOT NULL,
	[Year] [int] NOT NULL,
	[License] [nvarchar](10) NOT NULL,
	[Mileage] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[Color] [nvarchar](30) NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Active] [bit] NOT NULL,
	[DeactivationDate] [date] NULL,
	[Available] [bit] NOT NULL,
	[ResortVehicleStatusId] [nvarchar](25) NOT NULL,
	[ResortPropertyId] [int] NOT NULL,
 CONSTRAINT [pk_VehicleID] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResortVehicleStatus]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResortVehicleStatus](
	[ResortVehicleStatusId] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_ResortVehicleStatusId] PRIMARY KEY CLUSTERED 
(
	[ResortVehicleStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [pk_RoleID] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(100000,1) NOT NULL,
	[RoomNumber] [int] NOT NULL,
	[BuildingID] [nvarchar](50) NOT NULL,
	[RoomTypeID] [nvarchar](35) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[RoomStatusID] [nvarchar](25) NOT NULL,
	[OfferingID] [int] NULL,
	[Capacity] [int] NOT NULL,
	[ResortPropertyID] [int] NOT NULL,
 CONSTRAINT [pk_RoomID] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ak_RoomNumber_BuildingID] UNIQUE NONCLUSTERED 
(
	[RoomNumber] ASC,
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomReservation]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomReservation](
	[RoomReservationID] [int] IDENTITY(100000,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
	[CheckInDate] [date] NULL,
	[CheckOutDate] [date] NULL,
 CONSTRAINT [pk_RoomReservationID] PRIMARY KEY CLUSTERED 
(
	[RoomReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomStatus](
	[RoomStatusID] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [pk_RoomStatusID] PRIMARY KEY CLUSTERED 
(
	[RoomStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [nvarchar](35) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_RoomTypeID] PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduledItem]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduledItem](
	[AppointmentID] [int] NOT NULL,
	[ServiceComponentID] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_AppointmentID_ServiceComponentID] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC,
	[ServiceComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceComponent]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceComponent](
	[ServiceComponentID] [nvarchar](50) NOT NULL,
	[OfferingID] [int] NOT NULL,
	[Duration] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_ServiceComponentID] PRIMARY KEY CLUSTERED 
(
	[ServiceComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setup]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setup](
	[SetupID] [int] IDENTITY(100000,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[DateEntered] [date] NOT NULL,
	[DateRequired] [date] NOT NULL,
	[Comments] [nvarchar](1000) NULL,
 CONSTRAINT [pk_SetupID] PRIMARY KEY CLUSTERED 
(
	[SetupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetupList]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupList](
	[SetupListID] [int] IDENTITY(100000,1) NOT NULL,
	[SetupID] [int] NOT NULL,
	[Completed] [bit] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Comments] [nvarchar](1000) NOT NULL,
 CONSTRAINT [pk_SetupListID] PRIMARY KEY CLUSTERED 
(
	[SetupListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ShopID] [int] IDENTITY(100000,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_ShopID] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ak_RoomID] UNIQUE NONCLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopOffering]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopOffering](
	[ShopID] [int] NOT NULL,
	[OfferingID] [int] NOT NULL,
 CONSTRAINT [pk_ShopID_OfferingID] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC,
	[OfferingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShuttleReservation]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShuttleReservation](
	[ShuttleReservationID] [int] IDENTITY(100000,1) NOT NULL,
	[GuestID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PickupLocation] [nvarchar](150) NOT NULL,
	[DropoffDestination] [nvarchar](150) NOT NULL,
	[PickupDateTime] [datetime] NOT NULL,
	[DropoffDateTime] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_ShuttleReservationID] PRIMARY KEY CLUSTERED 
(
	[ShuttleReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialOrder]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialOrder](
	[SpecialOrderID] [int] IDENTITY(200004,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[DateOrdered] [datetime] NOT NULL,
	[Supplier] [nvarchar](1000) NOT NULL,
	[Authorized] [nvarchar](1000) NULL,
 CONSTRAINT [pk SpecialOrderID] PRIMARY KEY CLUSTERED 
(
	[SpecialOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialOrderLine]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialOrderLine](
	[NameID] [nvarchar](1000) NOT NULL,
	[SpecialOrderID] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[OrderQty] [int] NOT NULL,
	[QtyReceived] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsor]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsor](
	[SponsorID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](2) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](100) NOT NULL,
	[DateAdded] [date] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_SponsorID] PRIMARY KEY CLUSTERED 
(
	[SponsorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(100000,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[PostalCode] [nvarchar](12) NOT NULL,
	[Country] [nvarchar](25) NOT NULL,
	[PhoneNumber] [nvarchar](11) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[ContactFirstName] [nvarchar](50) NOT NULL,
	[ContactLastName] [nvarchar](100) NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [pk_SupplierID] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ak_SupplierEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierOrder]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierOrder](
	[SupplierOrderID] [int] IDENTITY(100005,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[OrderComplete] [bit] NOT NULL,
	[DateOrdered] [datetime] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [pk_SupplierOrderID] PRIMARY KEY CLUSTERED 
(
	[SupplierOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierOrderLine]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierOrderLine](
	[ItemID] [int] NOT NULL,
	[SupplierOrderID] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[OrderQty] [int] NOT NULL,
	[QtyReceived] [int] NULL,
	[UnitPrice] [money] NOT NULL,
 CONSTRAINT [pk_SupplierOrderLineID] PRIMARY KEY CLUSTERED 
(
	[SupplierOrderID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThreadParticipant]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThreadParticipant](
	[ThreadID] [int] NOT NULL,
	[ParticipantEmail] [nvarchar](250) NOT NULL,
	[ParticipantAlias] [nvarchar](250) NOT NULL,
	[SilenceNewMessages] [bit] NOT NULL,
	[HasUnreadMessages] [bit] NOT NULL,
	[HideThread] [bit] NOT NULL,
 CONSTRAINT [pk_threadID_participantEmail] PRIMARY KEY CLUSTERED 
(
	[ThreadID] ASC,
	[ParticipantEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpPickTable]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpPickTable](
	[PickSheetID] [nvarchar](25) NOT NULL,
	[InternalOrderID] [nvarchar](25) NOT NULL,
	[ItemID] [int] NOT NULL,
	[PickedBy] [int] NOT NULL,
	[PickDateTime] [datetime] NOT NULL,
 CONSTRAINT [pk_TmpPickSheet_PickSheetID] PRIMARY KEY CLUSTERED 
(
	[PickSheetID] ASC,
	[InternalOrderID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleCheckout]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleCheckout](
	[VehicleCheckoutId] [int] IDENTITY(100000,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DateCheckedOut] [date] NOT NULL,
	[DateReturned] [date] NULL,
	[DateExpectedBack] [date] NOT NULL,
	[Returned] [bit] NULL,
	[ResortVehicleId] [int] NOT NULL,
 CONSTRAINT [pk_VehicleCheckoutId] PRIMARY KEY CLUSTERED 
(
	[VehicleCheckoutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ('9c9064c59f1ffa2e174ee754d2979be80dd30db552ec03e7e327e9b1a4bd594e') FOR [PasswordHash]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ('UNASSIGNED') FOR [EventTypeID]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ((0)) FOR [KidsAllowed]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ((0)) FOR [Sponsored]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[Event] ADD  DEFAULT ((0)) FOR [PublicEvent]
GO
ALTER TABLE [dbo].[Guest] ADD  DEFAULT ('Basic Guest') FOR [GuestTypeID]
GO
ALTER TABLE [dbo].[Guest] ADD  DEFAULT ((0)) FOR [Minor]
GO
ALTER TABLE [dbo].[Guest] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Guest] ADD  DEFAULT ((0)) FOR [CheckedIn]
GO
ALTER TABLE [dbo].[HouseKeepingRequest] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[InternalOrder] ADD  DEFAULT ((0)) FOR [OrderComplete]
GO
ALTER TABLE [dbo].[InternalOrder] ADD  DEFAULT (getdate()) FOR [DateOrdered]
GO
ALTER TABLE [dbo].[InternalOrderLine] ADD  DEFAULT ((0)) FOR [QtyReceived]
GO
ALTER TABLE [dbo].[InternalOrderLine] ADD  DEFAULT ((1)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[InternalOrderLine] ADD  DEFAULT ((0)) FOR [OutOfStock]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT ('UNASSIGNED') FOR [ItemTypeID]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT (getdate()) FOR [DateActive]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT (NULL) FOR [RecipeID]
GO
ALTER TABLE [dbo].[ItemSupplier] ADD  DEFAULT ((0)) FOR [LeadTimeDays]
GO
ALTER TABLE [dbo].[ItemSupplier] ADD  DEFAULT ((0.0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[ItemSupplier] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MaintenanceType] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder] ADD  DEFAULT ((0)) FOR [Complete]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT ('9c9064c59f1ffa2e174ee754d2979be80dd30db552ec03e7e327e9b1a4bd594e') FOR [PasswordHash]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MemberTab] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[MemberTab] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[MemberTabLine] ADD  DEFAULT (getdate()) FOR [DatePurchased]
GO
ALTER TABLE [dbo].[MessageThread] ADD  DEFAULT ((0)) FOR [Archived]
GO
ALTER TABLE [dbo].[Offering] ADD  DEFAULT ('UNASSIGNED') FOR [OfferingTypeID]
GO
ALTER TABLE [dbo].[Offering] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Performance] ADD  DEFAULT ((0)) FOR [Cancelled]
GO
ALTER TABLE [dbo].[Pet] ADD  DEFAULT ('UNASSIGNED') FOR [PetTypeID]
GO
ALTER TABLE [dbo].[PickSheet] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PickSheet] ADD  DEFAULT ((0)) FOR [NumberOfOrders]
GO
ALTER TABLE [dbo].[PickSheet] ADD  DEFAULT ((100000)) FOR [PickSheetNumber]
GO
ALTER TABLE [dbo].[Receiving] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Recipe] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Recipe] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Reservation] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ('UNASSIGNED') FOR [RoomStatusID]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((2)) FOR [Capacity]
GO
ALTER TABLE [dbo].[RoomType] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ServiceComponent] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[SetupList] ADD  DEFAULT ((0)) FOR [Completed]
GO
ALTER TABLE [dbo].[Shop] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ShuttleReservation] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[SpecialOrder] ADD  DEFAULT ('') FOR [Authorized]
GO
ALTER TABLE [dbo].[Sponsor] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[SupplierOrder] ADD  DEFAULT ((0)) FOR [OrderComplete]
GO
ALTER TABLE [dbo].[SupplierOrder] ADD  DEFAULT (getdate()) FOR [DateOrdered]
GO
ALTER TABLE [dbo].[SupplierOrderLine] ADD  DEFAULT ((0)) FOR [QtyReceived]
GO
ALTER TABLE [dbo].[ThreadParticipant] ADD  DEFAULT ((0)) FOR [SilenceNewMessages]
GO
ALTER TABLE [dbo].[ThreadParticipant] ADD  DEFAULT ((0)) FOR [HasUnreadMessages]
GO
ALTER TABLE [dbo].[ThreadParticipant] ADD  DEFAULT ((0)) FOR [HideThread]
GO
ALTER TABLE [dbo].[tmpPickTable] ADD  DEFAULT (getdate()) FOR [PickDateTime]
GO
ALTER TABLE [dbo].[Appointment]  WITH NOCHECK ADD  CONSTRAINT [fk_AppointmentTypeID_Appointment] FOREIGN KEY([AppointmentTypeID])
REFERENCES [dbo].[AppointmentType] ([AppointmentTypeID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [fk_AppointmentTypeID_Appointment]
GO
ALTER TABLE [dbo].[Appointment]  WITH NOCHECK ADD  CONSTRAINT [fk_GuestID_Appointment] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [fk_GuestID_Appointment]
GO
ALTER TABLE [dbo].[Building]  WITH NOCHECK ADD  CONSTRAINT [fk_ResortPropertyID_Building] FOREIGN KEY([ResortPropertyID])
REFERENCES [dbo].[ResortProperty] ([ResortPropertyID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [fk_ResortPropertyID_Building]
GO
ALTER TABLE [dbo].[Employee]  WITH NOCHECK ADD  CONSTRAINT [fk_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [fk_DepartmentID]
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH NOCHECK ADD  CONSTRAINT [fk_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRole] CHECK CONSTRAINT [fk_EmployeeID]
GO
ALTER TABLE [dbo].[EmployeeRole]  WITH NOCHECK ADD  CONSTRAINT [fk_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeRole] CHECK CONSTRAINT [fk_RoleID]
GO
ALTER TABLE [dbo].[Event]  WITH NOCHECK ADD  CONSTRAINT [fk_EventType] FOREIGN KEY([EventTypeID])
REFERENCES [dbo].[EventType] ([EventTypeID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_EventType]
GO
ALTER TABLE [dbo].[Event]  WITH NOCHECK ADD  CONSTRAINT [fk_OfferingID] FOREIGN KEY([OfferingID])
REFERENCES [dbo].[Offering] ([OfferingID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_OfferingID]
GO
ALTER TABLE [dbo].[Event]  WITH NOCHECK ADD  CONSTRAINT [fk_ReqEvEmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [fk_ReqEvEmployeeID]
GO
ALTER TABLE [dbo].[EventEmployee]  WITH NOCHECK ADD  CONSTRAINT [fk_EmployeeID_EventEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EventEmployee] CHECK CONSTRAINT [fk_EmployeeID_EventEmployee]
GO
ALTER TABLE [dbo].[EventEmployee]  WITH NOCHECK ADD  CONSTRAINT [fk_EventID_EventEmployee] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventEmployee] CHECK CONSTRAINT [fk_EventID_EventEmployee]
GO
ALTER TABLE [dbo].[EventPerformance]  WITH NOCHECK ADD  CONSTRAINT [fk_EventID_EventPerformance] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[EventPerformance] CHECK CONSTRAINT [fk_EventID_EventPerformance]
GO
ALTER TABLE [dbo].[EventPerformance]  WITH NOCHECK ADD  CONSTRAINT [fk_PerformanceID_EventPerformance] FOREIGN KEY([PerformanceID])
REFERENCES [dbo].[Performance] ([PerformanceID])
GO
ALTER TABLE [dbo].[EventPerformance] CHECK CONSTRAINT [fk_PerformanceID_EventPerformance]
GO
ALTER TABLE [dbo].[Guest]  WITH NOCHECK ADD  CONSTRAINT [fk_GuestMemberID] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [fk_GuestMemberID]
GO
ALTER TABLE [dbo].[Guest]  WITH NOCHECK ADD  CONSTRAINT [fk_GuestTypeID] FOREIGN KEY([GuestTypeID])
REFERENCES [dbo].[GuestType] ([GuestTypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [fk_GuestTypeID]
GO
ALTER TABLE [dbo].[GuestRoomAssignment]  WITH NOCHECK ADD  CONSTRAINT [fk_GuestID_GuestRoomAssignment] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[GuestRoomAssignment] CHECK CONSTRAINT [fk_GuestID_GuestRoomAssignment]
GO
ALTER TABLE [dbo].[GuestRoomAssignment]  WITH NOCHECK ADD  CONSTRAINT [fk_RoomReservationID_GuestRoomAssignment] FOREIGN KEY([RoomReservationID])
REFERENCES [dbo].[RoomReservation] ([RoomReservationID])
GO
ALTER TABLE [dbo].[GuestRoomAssignment] CHECK CONSTRAINT [fk_RoomReservationID_GuestRoomAssignment]
GO
ALTER TABLE [dbo].[Inspection]  WITH CHECK ADD  CONSTRAINT [fk_ResortPropertyID_Inspection] FOREIGN KEY([ResortPropertyID])
REFERENCES [dbo].[ResortProperty] ([ResortPropertyID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Inspection] CHECK CONSTRAINT [fk_ResortPropertyID_Inspection]
GO
ALTER TABLE [dbo].[InternalOrder]  WITH NOCHECK ADD  CONSTRAINT [fk_InternalOrder_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InternalOrder] CHECK CONSTRAINT [fk_InternalOrder_DepartmentID]
GO
ALTER TABLE [dbo].[InternalOrder]  WITH NOCHECK ADD  CONSTRAINT [fk_InternalOrder_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[InternalOrder] CHECK CONSTRAINT [fk_InternalOrder_EmployeeID]
GO
ALTER TABLE [dbo].[InternalOrderLine]  WITH NOCHECK ADD  CONSTRAINT [fk_InternalOrderLine_InternalOrderID] FOREIGN KEY([InternalOrderID])
REFERENCES [dbo].[InternalOrder] ([InternalOrderID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InternalOrderLine] CHECK CONSTRAINT [fk_InternalOrderLine_InternalOrderID]
GO
ALTER TABLE [dbo].[InternalOrderLine]  WITH NOCHECK ADD  CONSTRAINT [fk_InternalOrderLine_ItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InternalOrderLine] CHECK CONSTRAINT [fk_InternalOrderLine_ItemID]
GO
ALTER TABLE [dbo].[InternalOrderLine]  WITH NOCHECK ADD  CONSTRAINT [fk_InternalOrderLinePickSheetID] FOREIGN KEY([PickSheetID])
REFERENCES [dbo].[PickSheet] ([PickSheetID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[InternalOrderLine] NOCHECK CONSTRAINT [fk_InternalOrderLinePickSheetID]
GO
ALTER TABLE [dbo].[Item]  WITH NOCHECK ADD  CONSTRAINT [fk_ItemTypeID_Item] FOREIGN KEY([ItemTypeID])
REFERENCES [dbo].[ItemType] ([ItemTypeID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [fk_ItemTypeID_Item]
GO
ALTER TABLE [dbo].[Item]  WITH NOCHECK ADD  CONSTRAINT [fk_OfferingID_Item] FOREIGN KEY([OfferingID])
REFERENCES [dbo].[Offering] ([OfferingID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [fk_OfferingID_Item]
GO
ALTER TABLE [dbo].[Item]  WITH NOCHECK ADD  CONSTRAINT [fk_RecipeID_Item] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [fk_RecipeID_Item]
GO
ALTER TABLE [dbo].[ItemSupplier]  WITH NOCHECK ADD  CONSTRAINT [fk_ItemSupplier_ItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[ItemSupplier] CHECK CONSTRAINT [fk_ItemSupplier_ItemID]
GO
ALTER TABLE [dbo].[ItemSupplier]  WITH NOCHECK ADD  CONSTRAINT [fk_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[ItemSupplier] CHECK CONSTRAINT [fk_SupplierID]
GO
ALTER TABLE [dbo].[Luggage]  WITH CHECK ADD  CONSTRAINT [fk_LuggageGuestID] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Luggage] CHECK CONSTRAINT [fk_LuggageGuestID]
GO
ALTER TABLE [dbo].[Luggage]  WITH CHECK ADD  CONSTRAINT [fk_LuggageStatusID] FOREIGN KEY([LuggageStatusID])
REFERENCES [dbo].[LuggageStatus] ([LuggageStatusID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Luggage] CHECK CONSTRAINT [fk_LuggageStatusID]
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder]  WITH NOCHECK ADD  CONSTRAINT [fk_MaintenanceStatusID] FOREIGN KEY([MaintenanceStatus])
REFERENCES [dbo].[MaintenanceStatus] ([MaintenanceStatusID])
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder] CHECK CONSTRAINT [fk_MaintenanceStatusID]
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder]  WITH NOCHECK ADD  CONSTRAINT [fk_MaintenanceTypeID] FOREIGN KEY([MaintenanceTypeID])
REFERENCES [dbo].[MaintenanceType] ([MaintenanceTypeID])
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder] CHECK CONSTRAINT [fk_MaintenanceTypeID]
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder]  WITH NOCHECK ADD  CONSTRAINT [fk_RequestingEmployeeID] FOREIGN KEY([RequestingEmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder] CHECK CONSTRAINT [fk_RequestingEmployeeID]
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder]  WITH NOCHECK ADD  CONSTRAINT [fk_ResortPropertyID] FOREIGN KEY([ResortPropertyID])
REFERENCES [dbo].[ResortProperty] ([ResortPropertyID])
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder] CHECK CONSTRAINT [fk_ResortPropertyID]
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder]  WITH NOCHECK ADD  CONSTRAINT [fk_WorkingEmployeeID] FOREIGN KEY([WorkingEmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[MaintenanceWorkOrder] CHECK CONSTRAINT [fk_WorkingEmployeeID]
GO
ALTER TABLE [dbo].[MemberTab]  WITH NOCHECK ADD  CONSTRAINT [fk_MemberID_MemberTab] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[MemberTab] CHECK CONSTRAINT [fk_MemberID_MemberTab]
GO
ALTER TABLE [dbo].[MemberTabLine]  WITH NOCHECK ADD  CONSTRAINT [fk_EmployeeID_MemberTab] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[MemberTabLine] CHECK CONSTRAINT [fk_EmployeeID_MemberTab]
GO
ALTER TABLE [dbo].[MemberTabLine]  WITH NOCHECK ADD  CONSTRAINT [fk_GuestID_MemberTab] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[MemberTabLine] CHECK CONSTRAINT [fk_GuestID_MemberTab]
GO
ALTER TABLE [dbo].[MemberTabLine]  WITH NOCHECK ADD  CONSTRAINT [fk_MemberTabID_MemberTabLine] FOREIGN KEY([MemberTabID])
REFERENCES [dbo].[MemberTab] ([MemberTabID])
GO
ALTER TABLE [dbo].[MemberTabLine] CHECK CONSTRAINT [fk_MemberTabID_MemberTabLine]
GO
ALTER TABLE [dbo].[MemberTabLine]  WITH NOCHECK ADD  CONSTRAINT [fk_OfferingID_MemberTab] FOREIGN KEY([OfferingID])
REFERENCES [dbo].[Offering] ([OfferingID])
GO
ALTER TABLE [dbo].[MemberTabLine] CHECK CONSTRAINT [fk_OfferingID_MemberTab]
GO
ALTER TABLE [dbo].[Offering]  WITH NOCHECK ADD  CONSTRAINT [fk_EmployeeID_Offering] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Offering] CHECK CONSTRAINT [fk_EmployeeID_Offering]
GO
ALTER TABLE [dbo].[Offering]  WITH NOCHECK ADD  CONSTRAINT [fk_OfferingTypeID_Offering] FOREIGN KEY([OfferingTypeID])
REFERENCES [dbo].[OfferingType] ([OfferingTypeID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Offering] CHECK CONSTRAINT [fk_OfferingTypeID_Offering]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [fk_Pet_GuestID] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [fk_Pet_GuestID]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [fk_Pet_PetTypeID] FOREIGN KEY([PetTypeID])
REFERENCES [dbo].[PetType] ([PetTypeID])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [fk_Pet_PetTypeID]
GO
ALTER TABLE [dbo].[PetImageFileName]  WITH NOCHECK ADD  CONSTRAINT [fk_PetID] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pet] ([PetID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PetImageFileName] CHECK CONSTRAINT [fk_PetID]
GO
ALTER TABLE [dbo].[PickSheet]  WITH NOCHECK ADD  CONSTRAINT [fk_PickSheet_PickCreatedBy] FOREIGN KEY([PickSheetCreatedBy])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[PickSheet] CHECK CONSTRAINT [fk_PickSheet_PickCreatedBy]
GO
ALTER TABLE [dbo].[PickSheet]  WITH NOCHECK ADD  CONSTRAINT [fk_PickSheet_PickDeliveredBy] FOREIGN KEY([PickDeliveredBy])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[PickSheet] CHECK CONSTRAINT [fk_PickSheet_PickDeliveredBy]
GO
ALTER TABLE [dbo].[PickSheet]  WITH NOCHECK ADD  CONSTRAINT [fk_PickSheet_PickSheetCompletedBy] FOREIGN KEY([PickCompletedBy])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[PickSheet] CHECK CONSTRAINT [fk_PickSheet_PickSheetCompletedBy]
GO
ALTER TABLE [dbo].[Receiving]  WITH NOCHECK ADD  CONSTRAINT [fk_SupplierOrderID_Receiving] FOREIGN KEY([SupplierOrderID])
REFERENCES [dbo].[SupplierOrder] ([SupplierOrderID])
GO
ALTER TABLE [dbo].[Receiving] CHECK CONSTRAINT [fk_SupplierOrderID_Receiving]
GO
ALTER TABLE [dbo].[RecipeItemLine]  WITH NOCHECK ADD  CONSTRAINT [fk_ItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
GO
ALTER TABLE [dbo].[RecipeItemLine] CHECK CONSTRAINT [fk_ItemID]
GO
ALTER TABLE [dbo].[RecipeItemLine]  WITH NOCHECK ADD  CONSTRAINT [fk_RecipeID_RecipeItemLine] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipe] ([RecipeID])
GO
ALTER TABLE [dbo].[RecipeItemLine] CHECK CONSTRAINT [fk_RecipeID_RecipeItemLine]
GO
ALTER TABLE [dbo].[Reservation]  WITH NOCHECK ADD  CONSTRAINT [fk_MemberID_Reservation] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [fk_MemberID_Reservation]
GO
ALTER TABLE [dbo].[ResortProperty]  WITH CHECK ADD  CONSTRAINT [fk_ResortPropertyTypeID] FOREIGN KEY([ResortPropertyTypeID])
REFERENCES [dbo].[ResortPropertyType] ([ResortPropertyTypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ResortProperty] CHECK CONSTRAINT [fk_ResortPropertyTypeID]
GO
ALTER TABLE [dbo].[ResortVehicle]  WITH NOCHECK ADD  CONSTRAINT [fk_ResortVehicle_ResortPropertyId_ResortProperty] FOREIGN KEY([ResortPropertyId])
REFERENCES [dbo].[ResortProperty] ([ResortPropertyID])
GO
ALTER TABLE [dbo].[ResortVehicle] CHECK CONSTRAINT [fk_ResortVehicle_ResortPropertyId_ResortProperty]
GO
ALTER TABLE [dbo].[ResortVehicle]  WITH NOCHECK ADD  CONSTRAINT [fk_ResortVehicle_RVStatusId_ResortVehicleStatus] FOREIGN KEY([ResortVehicleStatusId])
REFERENCES [dbo].[ResortVehicleStatus] ([ResortVehicleStatusId])
GO
ALTER TABLE [dbo].[ResortVehicle] CHECK CONSTRAINT [fk_ResortVehicle_RVStatusId_ResortVehicleStatus]
GO
ALTER TABLE [dbo].[Room]  WITH NOCHECK ADD  CONSTRAINT [fk_Room_BuildingID] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Building] ([BuildingID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_Room_BuildingID]
GO
ALTER TABLE [dbo].[Room]  WITH NOCHECK ADD  CONSTRAINT [fk_Room_OfferingID] FOREIGN KEY([OfferingID])
REFERENCES [dbo].[Offering] ([OfferingID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_Room_OfferingID]
GO
ALTER TABLE [dbo].[Room]  WITH NOCHECK ADD  CONSTRAINT [fk_Room_ResortPropertyID] FOREIGN KEY([ResortPropertyID])
REFERENCES [dbo].[ResortProperty] ([ResortPropertyID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_Room_ResortPropertyID]
GO
ALTER TABLE [dbo].[Room]  WITH NOCHECK ADD  CONSTRAINT [fk_Room_RoomStatusID] FOREIGN KEY([RoomStatusID])
REFERENCES [dbo].[RoomStatus] ([RoomStatusID])
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_Room_RoomStatusID]
GO
ALTER TABLE [dbo].[Room]  WITH NOCHECK ADD  CONSTRAINT [fk_Room_RoomTypeID] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([RoomTypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [fk_Room_RoomTypeID]
GO
ALTER TABLE [dbo].[RoomReservation]  WITH NOCHECK ADD  CONSTRAINT [fk_ReservationID_RoomReservation] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservation] ([ReservationID])
GO
ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [fk_ReservationID_RoomReservation]
GO
ALTER TABLE [dbo].[RoomReservation]  WITH NOCHECK ADD  CONSTRAINT [fk_RoomID_RoomReservation] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[RoomReservation] CHECK CONSTRAINT [fk_RoomID_RoomReservation]
GO
ALTER TABLE [dbo].[ScheduledItem]  WITH NOCHECK ADD  CONSTRAINT [fk_AppointmentID_ScheduledItem] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointment] ([AppointmentID])
GO
ALTER TABLE [dbo].[ScheduledItem] CHECK CONSTRAINT [fk_AppointmentID_ScheduledItem]
GO
ALTER TABLE [dbo].[ScheduledItem]  WITH NOCHECK ADD  CONSTRAINT [fk_ServiceComponentID_ScheduledItem] FOREIGN KEY([ServiceComponentID])
REFERENCES [dbo].[ServiceComponent] ([ServiceComponentID])
GO
ALTER TABLE [dbo].[ScheduledItem] CHECK CONSTRAINT [fk_ServiceComponentID_ScheduledItem]
GO
ALTER TABLE [dbo].[ServiceComponent]  WITH NOCHECK ADD  CONSTRAINT [fk_OfferingID_ServiceComponent] FOREIGN KEY([OfferingID])
REFERENCES [dbo].[Offering] ([OfferingID])
GO
ALTER TABLE [dbo].[ServiceComponent] CHECK CONSTRAINT [fk_OfferingID_ServiceComponent]
GO
ALTER TABLE [dbo].[Setup]  WITH NOCHECK ADD  CONSTRAINT [fk_EventID] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Setup] CHECK CONSTRAINT [fk_EventID]
GO
ALTER TABLE [dbo].[SetupList]  WITH NOCHECK ADD  CONSTRAINT [fk_SetupID] FOREIGN KEY([SetupID])
REFERENCES [dbo].[Setup] ([SetupID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SetupList] CHECK CONSTRAINT [fk_SetupID]
GO
ALTER TABLE [dbo].[Shop]  WITH NOCHECK ADD  CONSTRAINT [fk_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [fk_RoomID]
GO
ALTER TABLE [dbo].[ShopOffering]  WITH NOCHECK ADD  CONSTRAINT [fk_OfferingID_ShopOffering] FOREIGN KEY([OfferingID])
REFERENCES [dbo].[Offering] ([OfferingID])
GO
ALTER TABLE [dbo].[ShopOffering] CHECK CONSTRAINT [fk_OfferingID_ShopOffering]
GO
ALTER TABLE [dbo].[ShopOffering]  WITH NOCHECK ADD  CONSTRAINT [fk_ShopID_ShopOffering] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shop] ([ShopID])
GO
ALTER TABLE [dbo].[ShopOffering] CHECK CONSTRAINT [fk_ShopID_ShopOffering]
GO
ALTER TABLE [dbo].[ShuttleReservation]  WITH NOCHECK ADD  CONSTRAINT [fk_EmployeeID_ShuttleReservation] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ShuttleReservation] CHECK CONSTRAINT [fk_EmployeeID_ShuttleReservation]
GO
ALTER TABLE [dbo].[ShuttleReservation]  WITH NOCHECK ADD  CONSTRAINT [fk_GuestID_ShuttleReservation] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ShuttleReservation] CHECK CONSTRAINT [fk_GuestID_ShuttleReservation]
GO
ALTER TABLE [dbo].[SpecialOrderLine]  WITH NOCHECK ADD  CONSTRAINT [fk_SpecialOrderLine_SpecialOrderID] FOREIGN KEY([SpecialOrderID])
REFERENCES [dbo].[SpecialOrder] ([SpecialOrderID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SpecialOrderLine] CHECK CONSTRAINT [fk_SpecialOrderLine_SpecialOrderID]
GO
ALTER TABLE [dbo].[SupplierOrder]  WITH CHECK ADD  CONSTRAINT [fk_SupplierOrder_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SupplierOrder] CHECK CONSTRAINT [fk_SupplierOrder_EmployeeID]
GO
ALTER TABLE [dbo].[SupplierOrder]  WITH CHECK ADD  CONSTRAINT [fk_SupplierOrder_SupplierID] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[SupplierOrder] CHECK CONSTRAINT [fk_SupplierOrder_SupplierID]
GO
ALTER TABLE [dbo].[SupplierOrderLine]  WITH CHECK ADD  CONSTRAINT [fk_SupplierOrderID] FOREIGN KEY([SupplierOrderID])
REFERENCES [dbo].[SupplierOrder] ([SupplierOrderID])
GO
ALTER TABLE [dbo].[SupplierOrderLine] CHECK CONSTRAINT [fk_SupplierOrderID]
GO
ALTER TABLE [dbo].[tmpPickTable]  WITH NOCHECK ADD  CONSTRAINT [fk_tmpPickSheetPickSheetID] FOREIGN KEY([PickSheetID])
REFERENCES [dbo].[PickSheet] ([PickSheetID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[tmpPickTable] NOCHECK CONSTRAINT [fk_tmpPickSheetPickSheetID]
GO
ALTER TABLE [dbo].[VehicleCheckout]  WITH NOCHECK ADD  CONSTRAINT [fk_VehicleCheckout_ResortVehicleId_ResortVehicle] FOREIGN KEY([ResortVehicleId])
REFERENCES [dbo].[ResortVehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[VehicleCheckout] CHECK CONSTRAINT [fk_VehicleCheckout_ResortVehicleId_ResortVehicle]
GO
/****** Object:  Trigger [dbo].[tr_roomassign_update]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Created By: James Heim and Jared Greenfield
-- Created On: 2019-04-25
-- Checks out a room Reservation when everryone in the room leaves.
CREATE TRIGGER [dbo].[tr_roomassign_update]
ON [dbo].[GuestRoomAssignment]
AFTER UPDATE
AS
	BEGIN
		DECLARE @RoomReservationID [int]
	    SELECT @RoomReservationID = [RoomReservationID] FROM Inserted
		IF (SELECT COUNT(GuestID)
			FROM GuestRoomAssignment GRA
					--INNER JOIN Inserted ON GRA.RoomReservationID = GRA.RoomReservationID
			WHERE CheckOutDate IS NULL
			  AND GRA.RoomReservationID = @RoomReservationID
			) = 0

	UPDATE [RoomReservation]
	
	SET CheckOutDate = GETDATE()
	WHERE RoomReservationID = @RoomReservationID

	END
GO
ALTER TABLE [dbo].[GuestRoomAssignment] ENABLE TRIGGER [tr_roomassign_update]
GO
/****** Object:  Trigger [dbo].[generate_supplier_order]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
 * Created: 2019/04/25
 * By: Richard Carroll
 * Triggers when an InternalOrder is made. 
 * Checks for Items that we're low on, and aggregates them into a result set, 
 * the result set is then used to Create SupplierOrders and the lines associated
 * with them.
*/
/*
 * Updated: 2019/05/01
 * By: Richard Carroll
 * Reason: It would be a bad idea to try to take lines from 
 * internal orders that have already been filled, as they 
 * are no longer taking from internal inventory.
*/
CREATE TRIGGER [dbo].[generate_supplier_order] on [dbo].[InternalOrder] after Insert
AS
    BEGIN
    
    DECLARE @ItemID as int;
    DECLARE @UnitPrice as money;
    DECLARE @SupplierID as int;
    DECLARE @PreviousSupplierID as int;
    DECLARE @SupplierOrderQty as int;
    DECLARE @SupplierOrderID as int;
    
    Declare supply_order_line_cursor Cursor For
        Select InternalOrderLine.ItemID, ItemSupplier.UnitPrice,
                ItemSupplier.SupplierID,
                (Item.ReorderQty - (Item.OnHandQty - InternalOrderLine.OrderQty)) - (Select sum(OrderQty) 
from SupplierOrderLine join SupplierOrder on SupplierOrder.SupplierOrderID = SupplierOrderLine.SupplierOrderID
 where SupplierOrderLine.ItemID = Item.ItemID AND SupplierOrder.OrderComplete = 0) AS SupplyOrderQty
               
               From Item Inner Join InternalOrderLine on Item.ItemID = InternalOrderLine.ItemID
			   inner join InternalOrder on InternalOrder.InternalOrderID = InternalOrderLine.InternalOrderID
               inner join ItemSupplier on InternalOrderLine.ItemID = ItemSupplier.ItemID
               Where ItemSupplier.PrimarySupplier = 1 AND (Item.OnHandQty - InternalOrderLine.OrderQty <= (Item.ReorderQty / 4))
			   And InternalOrder.OrderComplete = 0
               Order By SupplierID
       OPEN supply_order_line_cursor
       WHILE @@FETCH_STATUS = 0
       BEGIN 
       
        FETCH NEXT FROM supply_order_line_cursor into @ItemID, @UnitPrice, @SupplierID, @SupplierOrderQty
        Begin Transaction
        Begin Try
            IF @PreviousSupplierID != @SupplierID
                SET @PreviousSupplierID = @SupplierID
                Insert into dbo.SupplierOrder(Description, OrderComplete, DateOrdered, SupplierID)
                Values('Generated Supplier Order', 0, GetDate(), @SupplierID)
                SET @SupplierOrderID = SCOPE_IDENTITY()
            
            Insert into dbo.SupplierOrderLine(ItemID, SupplierOrderID, Description, OrderQty, UnitPrice)
            Values(@ItemID, @SupplierOrderID, 'Generated Supplier Order Line', @SupplierOrderQty, @UnitPrice)
            
        End Try
        Begin Catch
            IF @@TRANCOUNT > 0
                Rollback Transaction
        End Catch
        If @@Trancount > 0
            Commit Transaction
       
       END
   END
GO
ALTER TABLE [dbo].[InternalOrder] ENABLE TRIGGER [generate_supplier_order]
GO
/****** Object:  Trigger [dbo].[tr_membertab_membertabline_delete]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- James Heim and Jared Greenfield
-- Created 2019-04-26
-- Update the Total on a MemberTab after a TabLine was deleted.
CREATE TRIGGER [dbo].[tr_membertab_membertabline_delete]
ON [dbo].[MemberTabLine]
AFTER DELETE
AS
    BEGIN
        DECLARE @MemberTabID [int]
        DECLARE @TotalPrice  [money]

        SELECT @MemberTabID = [MemberTabID] FROM Deleted
		
		SELECT @TotalPrice  = SUM([Price] * [Quantity]) 
							  FROM [MemberTabLine]
							  WHERE [MemberTabID] = @MemberTabID 

		UPDATE [MemberTab]
		SET [TotalPrice] = @TotalPrice
		WHERE [MemberTab].[MemberTabID] = @MemberTabID
		

    END
GO
ALTER TABLE [dbo].[MemberTabLine] ENABLE TRIGGER [tr_membertab_membertabline_delete]
GO
/****** Object:  Trigger [dbo].[tr_membertab_membertabline_insert]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- James Heim and Jared Greenfield
-- Created 2019-04-26
-- Update the Total on a MemberTab after a new TabLine was inserted.
CREATE TRIGGER [dbo].[tr_membertab_membertabline_insert]
ON [dbo].[MemberTabLine]
AFTER INSERT
AS
    BEGIN
        DECLARE @MemberTabID [int]
        DECLARE @TotalPrice  [money]

        SELECT @MemberTabID = [MemberTabID] FROM Inserted
		
		SELECT @TotalPrice  = SUM([Price] * [Quantity])
							  FROM [MemberTabLine]
							  WHERE [MemberTabID] = @MemberTabID 

		UPDATE [MemberTab]
		SET [TotalPrice] = @TotalPrice
		WHERE [MemberTab].[MemberTabID] = @MemberTabID
		

    END
GO
ALTER TABLE [dbo].[MemberTabLine] ENABLE TRIGGER [tr_membertab_membertabline_insert]
GO
/****** Object:  Trigger [dbo].[tr_PickSheetIncrement]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		Eric Bostwick
-- Create date: 4/6/2019
-- Description:	Increments the PickSheetNumber Field in the PickSheet Table
-- =============================================
CREATE TRIGGER [dbo].[tr_PickSheetIncrement]
   ON  [dbo].[PickSheet] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;
	DECLARE @PickSheetNumber [int]
	DECLARE @PickSheetID [nvarchar](50)
	
	--Get the Picksheet ID of the record we just inserted
	SET @PickSheetID = (Select PickSheetID From inserted)
	--Get The Highest Picksheet Number from the table
	SET @PickSheetNumber = (SELECT MAX(PickSheetNumber) From PickSheet) + 1

	--If this is the first record Seed it with 100000
	SET @PickSheetNumber = ISNULL(@PickSheetNumber, 100000)	

	--Set the New picksheetNumber Value in the PickSheet table
	UPDATE PickSheet SET PickSheetNumber = @PickSheetNumber WHERE PickSheetID = @PickSheetID
	
END
GO
ALTER TABLE [dbo].[PickSheet] ENABLE TRIGGER [tr_PickSheetIncrement]
GO
/****** Object:  Trigger [dbo].[tr_roomreservation_update]    Script Date: 5/8/2019 6:21:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Created By: James Heim and Jared Greenfield
-- Created On: 2019-04-25
-- Finalizes the Member's tab
CREATE TRIGGER [dbo].[tr_roomreservation_update]
ON [dbo].[RoomReservation]
AFTER UPDATE
AS
	BEGIN
		DECLARE @ReservationID	[INT]
		DECLARE @RoomID			[INT]
        DECLARE @MemberID		[INT]
		DECLARE @TabID			[INT]
		DECLARE @TotalPrice		[INT]

	    SELECT @RoomID = [RoomID] FROM Inserted
	    SELECT @ReservationID = [ReservationID] FROM Inserted

	
	UPDATE [dbo].[Room]
	SET [RoomStatusID] = 'Ready for Cleaning'
	WHERE [Room].[RoomID] = @RoomID
	IF (SELECT COUNT(RoomReservationID) 
		FROM RoomReservation
		WHERE ReservationID = @ReservationID
		  AND CheckoutDate IS NULL
		) = 0
		BEGIN
		BEGIN TRANSACTION
			BEGIN TRY
			-- Deactivates the reservation
			UPDATE [dbo].[Reservation]
			SET [Active] = 0
			WHERE [ReservationID] = @ReservationID
			-- Retrieve Member from Reservation and Deactivate Member
			-- Makes it so no one can add items to the tab
			SELECT @MemberID = (SELECT [MemberID] FROM [dbo].[Reservation] WHERE [Reservation].[ReservationID] = @ReservationID)
			UPDATE [dbo].[Member]
			SET Member.Active = 0
			WHERE [Member].[MemberID] = @MemberID

			-- Retrieve TabID with MemberID
			SELECT @TabID = (SELECT MemberTabID FROM MemberTab WHERE MemberTab.Active = 1 AND MemberID = @MemberID)

			-- Sum up all tab items and place it in MemberTab total column
			SELECT @TotalPrice = SUM(Price * Quantity) FROM MemberTabLine WHERE MemberTabID = @TabID
			
			-- Finalize The Tab
			UPDATE [MemberTab]
			SET [Active] = 0,
				[TotalPrice] = @TotalPrice
				WHERE [MemberTabID] = @TabID
			
			END TRY
			
			BEGIN CATCH
				ROLLBACK TRANSACTION
			END CATCH
			
			COMMIT TRANSACTION
			
		END

	END
GO
ALTER TABLE [dbo].[RoomReservation] ENABLE TRIGGER [tr_roomreservation_update]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Human readable name of the type of appointment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppointmentType', @level2type=N'COLUMN',@level2name=N'AppointmentTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Craig Barkley' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppointmentType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppointmentType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Lookup table for grouping appointments together by type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AppointmentType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the building.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building', @level2type=N'COLUMN',@level2name=N'BuildingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Nullable field that describes the buildings function or physical characteristics.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Nullable field that would hold the name of the building, either as a generic name or a title.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building', @level2type=N'COLUMN',@level2name=N'BuildingName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Nullable field for if the building is located at a different mailing address than the main resort facility. Denotes street address.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Danielle Russo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-22' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A Building is the Building that a Member is staying in or where any shops may be at Millenial Resorts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2018-02-08 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-18 Author', @value=N'Danielle Russo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-18 Desc', @value=N'Changed length for Description, added nulls to BuildingName, Address, & Description added BuildingSatusID field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-20 Author', @value=N'Danielle Russo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-20 Desc', @value=N'Removed Active field, added ResortPropertyID field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Building'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable name of the status that would belong to the building' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuildingStatus', @level2type=N'COLUMN',@level2name=N'BuildingStatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A rough description of the status and/or what it might indicate to the operability of the building' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuildingStatus', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Danielle Russo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuildingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuildingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Holds the values for the different statuses that a building can have' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BuildingStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Caitlin Abelson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A Department is the section of Millenial Resorts that an employee works in.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field representing an employee''s assigned ID number.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First name of the employee.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Last name of the employee.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary non-work phone number of the employee.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The email the employee can be reached at. Also to be used as a username for logging in to company assets.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'SHA-256 hash value of the employees chosen password when logging into company assets. Default password is the has value for "newuser", and is 9c9064c59f1ffa2e174ee754d2979be80dd30db552ec03e7e327e9b1a4bd594e.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'PasswordHash'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the employee is active in the system or not, because employees are not deleted from the table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the department that the employee belongs to.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'Reference', @value=N'References the Department table''s DepartmentID field.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'----' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2018-01-01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'An Employee is someone that works at Millenial Resorts. They have a single Role in a single Department.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field representing an employee''s assigned ID number.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Reference', @value=N'References the Employee table''s EmployeeID.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the role, which can be assigned to an employee.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'References', @value=N'References the Role table''s RoleID field.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Eduardo Colon' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Link table to represent the possession of a role by an employee.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-28 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-28 Desc', @value=N'Removed cascades for EmployeeID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-02 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-02 Desc', @value=N'Changed RoleID foreign key constraint from an update cascade to an update/delete cascade' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmployeeRole'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field representing the ID of the event and its request.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable, assigned title for the event.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The ID number of the employee responsible for submitting the request or approving the customer submission for a request.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'References', @value=N'The Employee table''s EmployeeID field.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A name of the Event type.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The description of the event, including any acts, present vendors, associated cast members, or the purpose behind the event.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The date the event starts.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The date the event ends.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'EventEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether party goers are required to be above the local legal age to be considered an adult.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'KidsAllowed'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Maximum number of guests that can be served or admitted to the event.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'NumGuests'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Where the event is located, possibly a building on resort grounds or in some cases an external location.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the event is being funded from an external source who the resort will be crediting as the sponsor of the event.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Sponsored'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether management has approved the event to be held or not.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Approved'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If plans have already moved forward with the event, specifically payments need to be made to balance the account regarding the event, but it is determined that the event is no longer occuring' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'Cancelled'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How many seats are left to purchase' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'SeatsRemaining'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the event is open to the public/locals' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event', @level2type=N'COLUMN',@level2name=N'PublicEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Phillip Hansen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents both an event and an event request that is pending approval. An event being a public or private event hosted by the resort.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-08 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-08 Desc', @value=N'Updated to match Data dictionary and new form for event. Added Cancelled, SeatsRemaining, OfferingID, and PublicEvent fields. Removed SponsorID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Event'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A name of the Event type.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventType', @level2type=N'COLUMN',@level2name=N'EventTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A description of what this type of event is.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Craig Barkley' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents a type of Event that would be held by the resort.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EventType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented field that is used to identify guests in the data system.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'GuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The member that is responsible for this guest.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'MemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unknown.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'GuestTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First name of the guest.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Last name of the guest.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary contact phone number for the guest.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary contact email for the guest.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If the guest is considered legally a minor by local law.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'Minor'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If the guest has been marked for deletion or not.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If a guest is currently check into the resort grounds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest', @level2type=N'COLUMN',@level2name=N'CheckedIn'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Alisa Roehr' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A guest is anyone staying at the resort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-01 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-01 Desc', @value=N'Added CheckedIn bit field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-02 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-02 Desc', @value=N'Added default for the Minor column' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Updated By', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Updated Date', @value=N'2019-02-08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Guest'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field representative of the item in the data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A human readable name denoting the "type" (class, category) of an item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ItemTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Reference', @value=N'References the ItemType table''s ItemTypeID field.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ItemTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable name of the item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The description of the item, possibly what it is used for as well as physcial attributes it may posses and other relevant information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The date the item was created.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'DateActive'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the item is active in the data system.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How many of the item are currently available for use, or re-use, in the resort.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'OnHandQty'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'At what quantity the item will need to be re-ordered to maintain appropriate on hand stock levels.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item', @level2type=N'COLUMN',@level2name=N'ReorderQty'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Jared Greenfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'An item is any physical item that exists within the resort. There can be many types of items and each item can be an ingredient for another item linked through the RecipeLine table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-10 Author', @value=N'Austin Delaney/Jared Greenfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-10 Desc', @value=N'Added OfferingID field, added CutomerPurchasable field, added RecipeID field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Item'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID field of the item represented by this record' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the supplier that the record is indicative' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'References', @value=N'The SupplierID field of the Supplier table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Describes if the indicated supplier is the default supplier for this item' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier', @level2type=N'COLUMN',@level2name=N'PrimarySupplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How many days we could expect it to take if we ordered the indicated item from this indicated supplier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier', @level2type=N'COLUMN',@level2name=N'LeadTimeDays'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The price that our company pays per unit measurement of this item when ordering from this supplier.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier', @level2type=N'COLUMN',@level2name=N'UnitPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If this relationship is currently active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Eric Bostwick' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-04' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents a relationship between an Item and it''s supplier' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-14 Author', @value=N'Eric Bostwick' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-14 Desc', @value=N'Added active field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemSupplier'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A human readable name denoting the "type" (class, category) of an item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemType', @level2type=N'COLUMN',@level2name=N'ItemTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A rough description of the purpose of a certain type of item. Could also contain common features of this item, or safety information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Jared Greenfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'This is a lookup table for Item that contains all of the various types that an item could be. (cleaning supply, food item, happy face sticker package...)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ItemType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable title for the status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceStatus', @level2type=N'COLUMN',@level2name=N'MaintenanceStatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Dalton Cleveland' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-22' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A method of tracking the current status of maintenance work orders.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Human readable title of the class or type of maintenance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceType', @level2type=N'COLUMN',@level2name=N'MaintenanceTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Dalton Cleveland' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents the "types" of maintenance that can be performed by the maintenance persons at the resort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'In relevant scenarios, used to related to the specific piece of equipment that is being maintained.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceWorkOrder', @level2type=N'COLUMN',@level2name=N'ResortPropertyID'
GO
EXEC sys.sp_addextendedproperty @name=N'Reference', @value=N'References the ResortProperty tables primary key field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceWorkOrder', @level2type=N'COLUMN',@level2name=N'ResortPropertyID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Dalton Cleveland' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceWorkOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MaintenanceWorkOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto generated ID field of the message.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'MessageID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The email of the user who sent the message.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'SenderEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The date and time that the message was sent.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'DateTimeSent'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The subject line of the message.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The primary text body of the message.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'Body'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The ID of the thread that the message is attached to.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message', @level2type=N'COLUMN',@level2name=N'ThreadID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-04-24' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A text based message that is sent/attached to a message thread to communicate with other users.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto generated ID of the thread.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MessageThread', @level2type=N'COLUMN',@level2name=N'ThreadID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A reference to the first message that is used to contain the thread. Other header information is contained in this first message.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MessageThread', @level2type=N'COLUMN',@level2name=N'FirstMessage'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If the thread is marked as archived or not, typically by age or inactivity.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MessageThread', @level2type=N'COLUMN',@level2name=N'Archived'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MessageThread'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-04-24' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MessageThread'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents a thread to which users can attach messages to for the purpose of being viewed by other users.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MessageThread'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented field representing an Offering item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering', @level2type=N'COLUMN',@level2name=N'OfferingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable name of the type of offering.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering', @level2type=N'COLUMN',@level2name=N'OfferingTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field representing an employee''s assigned ID number. Why this is a part of this table im not sure.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A description of the offering/service. Possibly including relevant staff, relevant items, or other necessary information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Price of the offering.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the offering is currently active at the resort.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Jared Greenfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'These are the services that Millenial Resorts offers to it''s Members and Guests.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Offering'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable name for the type of offering.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfferingType', @level2type=N'COLUMN',@level2name=N'OfferingTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A description of the offering type, possibly including information on availability, location, or physical characteristics.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfferingType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Jared Greenfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfferingType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-27-01' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfferingType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Different types (groups, classes, categories) of offerings found at the resort.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OfferingType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented field representing the performance in data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance', @level2type=N'COLUMN',@level2name=N'PerformanceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The date that the performance is being offered.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance', @level2type=N'COLUMN',@level2name=N'PerformanceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A rough description of the performance, possibly including any acts that would be involved, any cast members that would be relevant, or other information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Jacob Miller' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'This could be a Performance at an Event or a Performance that you go and watch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance'
GO
EXEC sys.sp_addextendedproperty @name=N'Updated by', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance'
GO
EXEC sys.sp_addextendedproperty @name=N'Updated Date', @value=N'2019-02-08' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Performance'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field that represents the pet in data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet', @level2type=N'COLUMN',@level2name=N'PetID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A description of the pet, possibly including distinguishing physical characteristics such as color, approximate size, behavior, or other features.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet', @level2type=N'COLUMN',@level2name=N'GuestID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The type of pet.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet', @level2type=N'COLUMN',@level2name=N'PetTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable name of the pet.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet', @level2type=N'COLUMN',@level2name=N'PetName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The specific sub species of the pet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet', @level2type=N'COLUMN',@level2name=N'Species'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A picture of the pet, to identify it in necessary circumstances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet', @level2type=N'COLUMN',@level2name=N'PetPicture'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Carlos Arzu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A pet belonging to a guest/member' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-17 Author', @value=N'Craig Barkley' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-02-17 Desc', @value=N'Added Species field, added PetTypeID foreign key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-09 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-09 Desc', @value=N'Removed Active field, corrected PetTypeID field length to 25, added GuestID foreign key, added PetPicture field, updated PetTypeID foreign key to CHECK with ON DELETE DEFAULT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Pet'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The human readable species name.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PetType', @level2type=N'COLUMN',@level2name=N'PetTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Rough physical description of the species, also could list unique care requirements or other information.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PetType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Carlos Arzu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PetType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PetType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Denotes a pet''s type (non-unique species).' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PetType'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-09 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PetType'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-09 Desc', @value=N'Removed Species field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PetType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented field that represents the Recipe in data' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe', @level2type=N'COLUMN',@level2name=N'RecipeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'----' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Description of the recipe, possibly including directions or relevant instructions.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The date that the recipe was added to the data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe', @level2type=N'COLUMN',@level2name=N'DateAdded'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the recipe is active.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Jared Greenfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents anything that is an offering that is manufactured using items.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recipe'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The recipe that the RecipeItemLine is for.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipeItemLine', @level2type=N'COLUMN',@level2name=N'RecipeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The item that the RecipeItemLine adds to the recipe.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipeItemLine', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The quantity of the item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipeItemLine', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How to increment the item into a quantity.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipeItemLine', @level2type=N'COLUMN',@level2name=N'UnitOfMeasure'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Jared Greenfield' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipeItemLine'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipeItemLine'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A line of a recipe, contains an item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecipeItemLine'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field that identifies the reservation in data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation', @level2type=N'COLUMN',@level2name=N'ReservationID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The member responsible for the reservation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation', @level2type=N'COLUMN',@level2name=N'MemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How many guests the member will be in the party.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation', @level2type=N'COLUMN',@level2name=N'NumberOfGuests'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How many pets will be brought by the member.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation', @level2type=N'COLUMN',@level2name=N'NumberOfPets'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'What day the reservation begins.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation', @level2type=N'COLUMN',@level2name=N'ArrivalDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The final day of the reservation.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation', @level2type=N'COLUMN',@level2name=N'DepartureDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Anything of note, special requirements or adjustments needing to be made for the member or otherwise.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Matthew Lamarche' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A Reservation is made by a Member and details their stay at the resort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Reservation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID field that represents one record from only one of the Building, Room, or ResortVehicle tables.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortProperty', @level2type=N'COLUMN',@level2name=N'ResortPropertyID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the table that this record belongs to.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortProperty', @level2type=N'COLUMN',@level2name=N'ResortPropertyTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Danielle Russo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'This table essentially acts as a master lookup table for the records in the Building, ResortVehicle, and Room to be related to the MaintenanceWorkOrder table and the Inspection table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'This field will be the name of the table that the ResortProperty belongs to' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortPropertyType', @level2type=N'COLUMN',@level2name=N'ResortPropertyTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Danielle Russo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortPropertyType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortPropertyType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents a type of ResortProperty, which will point to a record in a seperate table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResortPropertyType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name or title of the role.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'RoleID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The description of what the role entails. Priveleges, responsibilities, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Eduardo Colon' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents a role or job that can be held by an employee.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto generated number field that identifies the room in data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'RoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Human relateble room number inside the building' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'RoomNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The building in which the room is located.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'BuildingID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The type or category of room.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'RoomTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A physical description of the room, including anything that hotel staff should know about a particular room or any features that differentiate it from other rooms of its type.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How many guests can stay in this room.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'Capacity'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Wes Richardson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A room in a building at the resort where a member can stay.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-02 Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room'
GO
EXEC sys.sp_addextendedproperty @name=N'Update 2019-03-02 Desc', @value=N'Removed Active field' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Human readable name that denotes the type of room' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomType', @level2type=N'COLUMN',@level2name=N'RoomTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Description of the room that would inclue amenities, features, layout, rate, or other standardized information for rooms of this type.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomType', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the room type is active or not.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomType', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Wes Richardson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A type or category of room. Rooms that often run the same rate or have the same layout.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomType'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto generated field unique to each shop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'ShopID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The ID field of the room that the shop is in, inside of the building it is in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'RoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the shop' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'James Heim' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-02-27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'This table keeps records of all the stores(coffee shops, restaurants, gift shops...) that exist in the resort. Each store exists in a single building.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shop'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto incremented number field used to identify the sponsor in data.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'SponsorID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the sponsor/company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The contact address of the sponsor/company headquarters.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'City of the sponsor or company headquarters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'State of the sponsor or company headquarters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary business number of the sponsor or company headquarters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary business email of the sponsor or company headquarters' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The first name of the sponsor or of the primary contact at the company.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'ContactFirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Last name of the sponsor or of the primary contact at the company.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'ContactLastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'What date this sponsorship was added to the data system.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'DateAdded'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether or not the sponsor is active.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor', @level2type=N'COLUMN',@level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Phillip Hansen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-01-23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A table containing information on people who often sponsor the events of the hotel or would be considered business associates of the hotel.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sponsor'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder', @level2type=N'COLUMN',@level2name=N'SupplierOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The employee responsible for placing the order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder', @level2type=N'COLUMN',@level2name=N'EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Any special notes pertaining to the order' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Whether the order has been fully received or if some items have yet to arrive at the resort' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder', @level2type=N'COLUMN',@level2name=N'OrderComplete'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The date the order was placed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder', @level2type=N'COLUMN',@level2name=N'DateOrdered'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The supplier that the order was placed with' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'References', @value=N'The ID field in the Supplier table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Carlos Arzu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'Unknown' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents an order placed with a supplier for a list of items, which are represented by SupplierOrderLine' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID field of the purchased item that this line is describing.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Reference', @value=N'The ID field of the Item table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Represents the ID of the order that this line is a part of.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine', @level2type=N'COLUMN',@level2name=N'SupplierOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Reference', @value=N'The ID field of the SupplierOrder table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine', @level2type=N'COLUMN',@level2name=N'SupplierOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Unknown' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The quantity of item ordered.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine', @level2type=N'COLUMN',@level2name=N'OrderQty'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The quantity that has so far been received of this order.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine', @level2type=N'COLUMN',@level2name=N'QtyReceived'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Carlos Arzu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'Unknown' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'When an order is placed with a supplier, records in this table are indicative of a "line" in that order, which will contain an item and all information pertaining to that particular purchase of the item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SupplierOrderLine'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The ID of the thread that the user is allowed to modify' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant', @level2type=N'COLUMN',@level2name=N'ThreadID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The email of the participant.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant', @level2type=N'COLUMN',@level2name=N'ParticipantEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The name or identity to which the participant will be externally viewed as.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant', @level2type=N'COLUMN',@level2name=N'ParticipantAlias'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If the participant recieves alerts for when new messages are posted to this thread.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant', @level2type=N'COLUMN',@level2name=N'SilenceNewMessages'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If the thread contains messages which have not been viewed by this participant.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant', @level2type=N'COLUMN',@level2name=N'HasUnreadMessages'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'If the thread should be "hidden" from this participants basic view.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant', @level2type=N'COLUMN',@level2name=N'HideThread'
GO
EXEC sys.sp_addextendedproperty @name=N'Author', @value=N'Austin Delaney' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant'
GO
EXEC sys.sp_addextendedproperty @name=N'Created Date', @value=N'2019-04-24' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A user who can view/attach messages within a thread.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ThreadParticipant'
GO

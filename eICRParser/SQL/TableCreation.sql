-- Creates a table for Address Codes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_address_codes](
	[code] [varchar](1) NOT NULL,
	[code_system] [varchar](25) NULL,
	[code_system_name] [varchar](25) NULL,
	[display_name] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Populates values into the address codes table
INSERT INTO eICR_address_codes
VALUES('o', 'nathan_address_codes', 'Nathans Address Codes', 'organization')
GO
GO

INSERT INTO eICR_address_codes
VALUES('r', 'nathan_address_codes', 'Nathans Address Codes', 'residence')
GO
GO

-- Creates a table to hold address information
CREATE TABLE [dbo].[eICR_addresses](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[doc_oid] [varchar](255) NULL,
	[street_address] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[addr_state] [varchar](255) NULL,
	[postal_code] [varchar](25) NULL,
	[addr_type] [varchar](5) NULL,
	[county] [varchar](50) NULL,
	[country] [varchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Creates an aggregate step to get the data where it needs to be correctly
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_aggStepper](
	[OID] [varchar](255) NULL,
	[original_OID] [varchar](255) NULL,
	[versionControlNum] [int] NULL,
	[location] [varchar](255) NULL,
	[mrn] [varchar](255) NULL,
	[given_name] [varchar](255) NULL,
	[family_name] [varchar](255) NULL,
	[patAddr] [int] NULL,
	[addr_state] [varchar](255) NULL,
	[postal_code] [varchar](25) NULL,
	[pat_telecom] [varchar](255) NULL,
	[gender_display] [varchar](255) NULL,
	[pat_language] [varchar](255) NULL,
	[dob] [date] NULL,
	[race_display] [varchar](255) NULL,
	[ethnicity_display] [varchar](255) NULL,
	[org_name] [varchar](255) NULL,
	[marital_display] [varchar](255) NULL,
	[pregnancy_status] [varchar](255) NULL,
	[travel_history] [varchar](255) NULL,
	[deceased] [varchar](255) NULL,
	[root] [varchar](255) NULL,
	[extension] [varchar](255) NULL,
	[raw_OID] [varchar](255) NULL,
	[orig_oid_raw] [varchar](255) NULL,
	[date_added] [datetime] NULL,
	[patAddr_ID] [int] NULL,
	[prov_state] [varchar](255) NULL,
	[hpi] [varchar](255) NULL,
	[dischargeDispositionCode] [varchar](255) NULL,
	[health_care_facility] [varchar](255) NULL,
	[service_provider_organization] [varchar](255) NULL,
	[age] [int] NULL,
	[eEncounter] [varchar](255) NULL,
	[eEncounter_code] [varchar](255) NULL,
	[eEncounter_display] [varchar](255) NULL,
	[eventDate] [date] NULL,
	[health_care_facility2] [varchar](255) NULL,
	[triggerCode] [varchar](255) NULL,
	[triggerName] [varchar](255) NULL,
	[encounterDate] [date] NULL,
	[triggerName2] [varchar](255) NULL,
	[triggerCode2] [varchar](255) NULL,
	[provider_address_id] [int] NULL
) ON [PRIMARY]
GO

-- Creates a table to store document information
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_documents](
	[recordNumber] [int] IDENTITY(1,1) NOT NULL,
	[OID] [varchar](255) NULL,
	[original_OID] [varchar](255) NULL,
	[patient] [int] NULL,
	[provider] [int] NULL,
	[healthCareFacility] [int] NULL,
	[serviceProvider] [int] NULL,
	[versionControlNum] [int] NULL,
	[location] [varchar](10) NULL,
	[date_added] [datetime] NULL,
	[hpi] [varchar](10) NULL,
	[dischargeDispositionCode] [varchar](10) NULL,
	[eE] [varchar](255) NULL,
	[eECode] [varchar](255) NULL,
	[eventDate] [date] NULL,
	[encounterDate] [date] NULL,
	[miscNotes] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[recordNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'Foreign Key', @value=N'Yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'eICR_documents2', @level2type=N'COLUMN',@level2name=N'OID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'A pre splitter ID given to records' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'eICR_documents2', @level2type=N'COLUMN',@level2name=N'original_OID'
GO
EXEC sys.sp_addextendedproperty @name=N'Foreign Key', @value=N'Yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'eICR_documents2', @level2type=N'COLUMN',@level2name=N'original_OID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'An ID assigned to patients from eICRs when placed into the DC_CEDEP_Sandbox_SSI database' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'eICR_documents2', @level2type=N'COLUMN',@level2name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'Foreign Key', @value=N'Yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'eICR_documents2', @level2type=N'COLUMN',@level2name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'Foreign Keys', @value=N'OID, original_OID, patient, provider, dischargeDispositionCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'eICR_documents2'
GO
EXEC sys.sp_addextendedproperty @name=N'Primary Key', @value=N'recordNumber' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'eICR_documents2'
GO

-- Creates a table to keep track fo encompassing encounter codes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_encompassing_encounter_codes](
	[code] [varchar](255) NOT NULL,
	[code_system] [varchar](255) NULL,
	[code_system_name] [varchar](255) NULL,
	[display_name] [varchar](255) NULL,
	[verified] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Creates an aggregate table that holds specific value level data for each RECORD
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_FinalResults](
	[OID] [varchar](255) NULL,
	[original_OID] [varchar](255) NULL,
	[versionControlNum] [int] NULL,
	[location] [varchar](255) NULL,
	[mrn] [varchar](255) NULL,
	[given_name] [varchar](255) NULL,
	[family_name] [varchar](255) NULL,
	[patAddr] [int] NULL,
	[addr_state] [varchar](255) NULL,
	[postal_code] [varchar](25) NULL,
	[pat_telecom] [varchar](255) NULL,
	[gender_display] [varchar](255) NULL,
	[pat_language] [varchar](255) NULL,
	[dob] [varchar](255) NULL,
	[race_display] [varchar](255) NULL,
	[ethnicity_display] [varchar](255) NULL,
	[org_name] [varchar](255) NULL,
	[marital_display] [varchar](255) NULL,
	[pregnancy_status] [varchar](255) NULL,
	[travel_history] [varchar](255) NULL,
	[deceased] [varchar](255) NULL,
	[root] [varchar](255) NULL,
	[extension] [varchar](255) NULL,
	[raw_OID] [varchar](255) NULL,
	[orig_oid_raw] [varchar](255) NULL,
	[date_added] [datetime] NULL,
	[patAddr_ID] [int] NULL,
	[prov_state] [varchar](255) NULL,
	[hpi] [varchar](255) NULL,
	[dischargeDispositionCode] [varchar](255) NULL,
	[health_care_facility] [varchar](255) NULL,
	[service_provider_organization] [varchar](255) NULL,
	[age] [int] NULL,
	[eEncounter] [varchar](255) NULL,
	[eEncounter_code] [varchar](255) NULL,
	[eEncounter_display] [varchar](255) NULL,
	[eventDate] [date] NULL,
	[health_care_facility2] [varchar](255) NULL,
	[encounterDate] [date] NULL,
	[triggerNameComb] [varchar](255) NULL,
	[triggerCodeComb] [varchar](255) NULL,
	[provider_address_id] [int] NULL
) ON [PRIMARY]
GO

-- Creates a table for gender codes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_gender_codes](
	[code] [varchar](3) NOT NULL,
	[code_system] [varchar](25) NULL,
	[code_system_name] [varchar](25) NULL,
	[display_name] [varchar](25) NULL,
	[verified] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Inserts gender code values into gender code table
INSERT INTO eICR_gender_codes
VALUES('F', '2.16.840.1.113883.5.1', 'AdministrativeGender', 'Female', 1)
GO

INSERT INTO eICR_gender_codes
VALUES('M', '2.16.840.1.113883.5.1', 'AdministrativeGender', 'Male', 1)
GO

INSERT INTO eICR_gender_codes
VALUES('UN', '2.16.840.1.113883.5.1', 'AdministrativeGender', 'Undifferentiated', 1)
GO

-- Creates a table for marriage codes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_marriage_codes](
	[code] [varchar](3) NOT NULL,
	[code_system] [varchar](25) NULL,
	[code_system_name] [varchar](25) NULL,
	[display_name] [varchar](25) NULL,
	[verified] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--Inserts Marriage Codes into the marriage codes TABLE
INSERT INTO eICR_marriage_codes
VALUES('A', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Annulled', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('D', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Divorced', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('I', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Interlocutory', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('L', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Legally Separated', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('M', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Married', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('P', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Polygamous', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('S', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Never Married', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('T', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Domestic Partner', 1)
GO

INSERT INTO eICR_marriage_codes
VALUES('W', '2.16.840.1.113883.5.2', 'MaritalStatus', 'Widowed', 1)
GO

-- Creates a table that is summarized and deidentified for use in Tableau
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_Missing_Data_Summary](
	[OID] [varchar](7) NOT NULL,
	[original_OID] [varchar](7) NOT NULL,
	[vcn] [int] NULL,
	[server_name] [varchar](255) NULL,
	[mrn] [varchar](15) NOT NULL,
	[given_name] [varchar](7) NOT NULL,
	[family_name] [varchar](7) NOT NULL,
	[patient_address] [varchar](7) NOT NULL,
	[patient_state] [varchar](255) NULL,
	[patient_zip] [varchar](25) NULL,
	[patient_phone] [varchar](7) NOT NULL,
	[gender] [varchar](255) NULL,
	[patient_language] [varchar](255) NULL,
	[dob] [varchar](7) NOT NULL,
	[race] [varchar](255) NULL,
	[ethnicity] [varchar](255) NULL,
	[org_name] [varchar](255) NULL,
	[marital_status] [varchar](255) NULL,
	[pregnancy_status] [varchar](7) NOT NULL,
	[travel_hitsory] [varchar](7) NOT NULL,
	[deceased] [varchar](255) NULL,
	[provider_root] [varchar](255) NULL,
	[provider_extension] [varchar](255) NULL,
	[raw_OID] [varchar](255) NULL,
	[orig_oid_raw] [varchar](255) NULL,
	[date_added] [datetime] NULL,
	[patient_address_id] [int] NULL,
	[provider_state] [varchar](255) NULL,
	[hpi] [varchar](7) NOT NULL,
	[dischargeDispositionCode] [varchar](255) NULL,
	[health_care_facility] [varchar](255) NULL,
	[service_provider_organization] [varchar](255) NULL,
	[age] [int] NULL,
	[eEncounter] [varchar](255) NULL,
	[eEncounter_code] [varchar](255) NULL,
	[eEncounter_display] [varchar](255) NULL,
	[eventDate] [date] NULL,
	[health_care_facility2] [varchar](255) NULL,
	[encounterDate] [date] NULL,
	[triggerNameComb] [varchar](255) NULL,
	[triggerCodeComb] [varchar](255) NULL,
	[provider_address_id] [int] NULL
) ON [PRIMARY]
GO

-- Creates a table to store patient DATABASE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_patients](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[OID] [varchar](255) NULL,
	[mrn] [varchar](255) NULL,
	[given_name] [varchar](255) NULL,
	[family_name] [varchar](255) NULL,
	[address] [int] NULL,
	[telecom] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[pat_language] [varchar](255) NULL,
	[dob] [varchar](255) NULL,
	[race] [varchar](255) NULL,
	[ethnicity] [varchar](255) NULL,
	[provider] [int] NULL,
	[marital_status] [varchar](255) NULL,
	[pregnancy_status] [varchar](255) NULL,
	[travel_history] [varchar](255) NULL,
	[deceased] [varchar](255) NULL,
	[vcn] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Creates a table to store provider information
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_provider_organizations](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[root] [varchar](255) NULL,
	[extension] [varchar](100) NULL,
	[org_name] [varchar](255) NULL,
	[telecom] [varchar](25) NULL,
	[address] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Creates a table for race and ethnicity codes
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_race_ethnicity_codes](
	[code] [varchar](10) NOT NULL,
	[code_system] [varchar](25) NULL,
	[code_system_name] [varchar](50) NULL,
	[display_name] [varchar](100) NULL,
	[verified] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Populate race ethnicity code TABLE
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1000-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Race', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1002-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'American Indian or Alaska Native', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1004-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1006-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Abenaki', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1008-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Algonquian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1010-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1011-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chiricahua', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1012-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Sill Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1013-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Jicarilla Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1014-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lipan Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1015-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mescalero Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1016-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1017-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Payson Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1018-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Carlos Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1019-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'White Moutnain Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1021-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Arapaho', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1022-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Northern Arapaho', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1023-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Southern Arapaho', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1024-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wind River Arapaho', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1026-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Arikara', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1028-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Assiniboine', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1030-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Assiniboine Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1031-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Peck Assiniboine Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1033-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bannock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1035-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Blackfeet', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1037-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Brotherton', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1039-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Burt Lake Band', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1041-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Caddo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1042-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Cado', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1044-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cahuilla', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1045-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Agua Caliente Cahuilla', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1046-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Augustine', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1047-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cabazon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1048-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Los Coyotes', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1049-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Morongo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1050-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santa Rosa Cahuilla', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1051-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Torres-Martinez', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1053-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'California Tribes', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1054-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cahto', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1055-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chimariko', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1056-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coast Miwok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1057-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Digger', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1058-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kawaiisu', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1059-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kern River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1060-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mattole', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1061-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Red Wood', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1062-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santa Rosa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1063-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Takelma', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1064-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wappo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1065-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yana', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1066-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yuki', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1068-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Canadian and Latin American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1069-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Canadian Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1070-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Central American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1071-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'French American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1072-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mexican American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1073-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'South American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1074-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Spanish American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1076-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Catawba', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1078-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cayuse', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1080-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chehalis', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1082-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chemakuan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1083-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hoh', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1084-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Quileute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1086-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chemehuevi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1088-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cherokee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1089-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cherokee Alabama', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1090-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cherokees of Northeast Alabama', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1091-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cherokees of Southeast Alabama', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1092-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Cherokee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1093-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Echota Cherokee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1094-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Etowah Cherokee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1095-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Northern Cherokee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1096-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tuscola', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1097-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'United Keetowa Band of Cherokee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1098-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Western Cherokee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1100-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cherokee Shawnee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1102-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cheyenne', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1103-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Northern Cheyenne', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1104-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Southern Cheyenne', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1106-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cheyenne-Arapaho', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1108-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chickahominy', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1109-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Chickahominy', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1110-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Western Chickahominy', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1112-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chickasaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1114-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chinook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1115-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Clatsop', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1116-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Columbia River Chinook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1117-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kathlamet', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1118-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Upper Chinook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1119-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wakiakum Chinook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1120-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Willapa Chinook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1121-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wishram', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1123-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1124-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bad River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1125-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bay Mills Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1126-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bois Forte', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1127-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Burt Lake Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1128-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fond du Lac', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1129-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Grand Portage', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1130-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Grand Traverse Band of Ottawa/Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1131-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Keweenaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1132-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lac Courte Oreilles', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1133-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lac du Flambeau', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1134-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lac Vieux Desert Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1135-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lake Superior', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1136-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Leech Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1137-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Little Shell Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1138-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mille Lacs', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1139-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Minnesota Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1140-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ontonagon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1141-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Red Cliff Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1142-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Red Lake Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1143-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Saginaw Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1144-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'St. Croix Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1145-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sault Ste. Marie Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1146-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sokoagon Chippewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1147-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Turtle Mountain', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1148-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'White Earth', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1150-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chippewa Cree', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1151-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Rocky Boys Chippewa Cree', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1153-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chitimacha', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1155-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Choctaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1156-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Clifton Choctaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1157-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Jena Choctaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1158-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mississippi Choctaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1159-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mowa Band of Choctaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1160-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Choctaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1162-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chumash', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1163-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santa Ynez', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1165-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Clear Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1167-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coeur DAlene', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1169-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coharie', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1171-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Colorado River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1173-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Colville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1175-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Comanche', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1176-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Comanche', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1178-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coos, Lower Umpqua, Siuslaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1180-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coos', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1182-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coquilles', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1184-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Costanoan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1186-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coushatta', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1187-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alabama Coushatta', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1189-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cowlitz', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1191-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cree', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1193-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Creek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1194-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alabama Creek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1195-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alabama Quassarte', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1196-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Creek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1197-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Muscogee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1198-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kialegee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1199-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lower Muscogee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1200-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Machis Lower Creek Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1201-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Poarch Band', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1202-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Principal Creek Indian Nation', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1203-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Star Clan of Muscogee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1204-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Thlopthlocco', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1205-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tuckabachee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1207-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Croatan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1209-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Crow', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1211-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cupeno', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1212-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Agua Caliente', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1214-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Delaware', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1215-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Delaware', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1216-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lenni-Lenape', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1217-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Munsee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1218-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Deleware', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1219-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Rampough Mountain', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1220-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sand Hill', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1222-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Diegueno', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1223-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Campo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1224-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Capitan Grande', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1225-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cuyapaipe', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1226-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'La Posta', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1227-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Manzanita', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1228-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mesa Grande', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1229-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Pasqual', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1230-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santa Ysabel', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1231-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sycuan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1233-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Tribes', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1234-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Attacapa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1235-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Biloxi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1236-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Georgetown (Eastern Tribes)', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1237-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Moor', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1238-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nansemond', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1239-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Natchez', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1240-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nausu Waiwash', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1241-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nipmuc', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1242-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Paugussett', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1243-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pocomoke Acohonock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1244-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Southeaster Indians', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1245-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Susquehanock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1246-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tunica Biloxi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1247-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Waccamaw-Siousan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1248-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wicomico', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1250-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Esselen', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1252-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Belknap', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1254-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Berthold', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1256-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Mcdowell', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1258-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Hall', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1260-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gabrieleno', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1262-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Grand Ronde', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1264-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gros Ventres', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1265-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Atsina', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1267-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Haliwa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1269-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hidatsa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1271-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hoopa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1272-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Trinity', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1273-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Whilkut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1275-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hoopa Extension', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1277-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Houma', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1279-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Inaja-Cosmit', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1281-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iowa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1282-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iowa of Kansas-Nebraska', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1283-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iowa of Oklahoma', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1285-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iroquois', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1286-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cayuga', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1287-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mohawk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1288-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oneida', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1289-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Onondaga', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1290-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Seneca', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1291-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Seneca Nation', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1292-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDCv', 'Seneca-Cayuga', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1293-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tonawanda Seneca', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1294-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tuscarora', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1295-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wyandotte', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1297-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Juaneno', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1299-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kalispel', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1301-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Karuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1303-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1305-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kickapoo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1306-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Kickapoo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1307-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Texas Kickapoo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1309-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kiowa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1310-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Kiowa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1312-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Klallam', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1313-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Jamestown', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1314-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lower Elwha', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1315-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Port Gamble Klallam', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1317-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Klamath', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1319-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Konkow', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1321-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kootenai', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1323-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lassik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1325-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Long Island', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1326-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Matinecock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1327-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Montauk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1328-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Poospatuck', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1329-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Setauket', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1331-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Luiseno', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1332-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'La Jolla', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1333-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pala', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1334-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pauma', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1335-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pechanga', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1336-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Soboba', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1337-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Twenty-Nine Palms', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1338-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Temecula', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1340-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lumbee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1342-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lummi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1344-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Maidu', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1345-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mountain Maidu', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1346-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nishinam', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1348-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Makah', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1350-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Maliseet', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1352-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mandan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1354-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mattaponi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1356-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Menominee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1358-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Miami', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1359-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Illinois Miami', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1360-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Indiana Miami', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1361-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Miami', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1363-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Miccosukee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1365-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Micmac', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1366-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Aroostook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1368-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mission Indians', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1370-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Miwok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1372-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Modoc', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1374-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mohegan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1376-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mono', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1378-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nanticoke', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1380-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Narragansett', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1382-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Navajo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1383-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alamo Navajo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1384-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Canoncite Navajo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1385-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ramah Navajo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1387-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nez Perce', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1389-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nomalaki', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1391-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Northwest Tribes', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1392-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alsea', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1393-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Celilo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1394-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Columbia', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1395-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kalapuya', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1396-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Molala', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1397-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Talakamish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1398-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tenino', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1399-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tillamook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1400-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wenatchee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1401-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yahooskin', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1403-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Omaha', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1405-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oregon Athabaskan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1407-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Osage', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1409-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Otoe-Missouria', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1411-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ottawa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1412-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Burt Lake Ottawa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1413-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Michigan Ottawa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1414-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Ottawa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1416-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1417-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bishop', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1418-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bridgeport', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1419-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Burns Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1420-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cedarville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1421-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Bidwell', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1422-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Independence', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1423-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kaibab', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1424-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Las Vegas', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1425-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lone Pine', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1426-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lovelock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1427-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Malheur Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1428-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Moapa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1429-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Northern Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1430-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Owens Valley', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1431-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pyramid Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1432-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Juan Southern Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1433-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Southern Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1434-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Summit Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1435-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Utu Utu Gwaitu Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1436-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Walker River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1437-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yerington Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1439-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pamunkey', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1441-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Passamaquoddy', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1442-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Indian Township', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1443-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pleasant Point Passamaquoddy', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1445-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pawnee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1446-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Pawnee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1448-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Penobscot', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1450-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Peoria', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1451-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Peoria', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1453-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pequot', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1454-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Marshantucket Pequot', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1456-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pima', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1457-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gila River Pima-Maricopa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1458-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Salt River Pima-Maricopa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1460-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Piscataway', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1462-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pit River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1464-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pomo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1465-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Central Pomo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1466-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dry Creek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1467-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Pomo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1468-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kashia', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1469-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Northern Pomo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1470-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Scotts Valley', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1471-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Stonyford', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1472-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sulphur Bank', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1474-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ponca', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1475-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nebraska Ponca', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1476-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Ponca', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1478-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Potawatomi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1479-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Citizen Band Potawatomi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1480-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Forest County', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1481-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hannahville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1482-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Huron Potawatomi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1483-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pokagon Potawatomi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1484-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Prairie Band', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1485-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wisconsin Potawatomi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1487-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Powhatan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1489-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pueblo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1490-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Acoma', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1491-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Arizona Tewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1492-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cochiti', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1493-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hopi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1494-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Isleta', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1495-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Jemez', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1496-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Keres', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1497-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Laguna', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1498-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nambe', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1499-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Picuris', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1500-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Piro', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1501-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pojoaque', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1502-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Felipe', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1503-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Ildefonso', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1504-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Juan Pueblo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1505-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Juan De', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1506-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Juan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1507-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sandia', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1508-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santa Ana', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1509-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santa Clara', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1510-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santo Domingo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1511-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Taos', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1512-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tesuque', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1513-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tewa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1514-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tigua', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1515-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Zia', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1516-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Zuni', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1518-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Puget Sound Salish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1519-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Duwamish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1520-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kikiallus', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1521-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lower Skagit', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1522-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Muckleshoot', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1523-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nisqually', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1524-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nooksack', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1525-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Port Madison', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1526-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Puyallup', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1527-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Samish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1528-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sauk-Suiattle', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1529-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Skokomish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1530-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Skykomish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1531-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Snohomish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1532-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Snoqualmie', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1533-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Squaxin Island', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1534-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Steilacoom', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1535-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Stillaguamish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1536-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Suquamish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1537-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Swinomish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1538-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tulalip', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1539-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Upper Skagit', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1541-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Quapaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1543-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Quinault', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1545-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Rappahannock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1547-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Reno-Sparks', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1549-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Round Valley', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1551-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sac and Fox', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1552-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iowa Sac and Fox', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1553-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Missouri Sac and Fox', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1554-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Sac and Fox', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1556-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Salinan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1558-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Salish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1560-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Salish and Kootenai', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1562-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Schaghticoke', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1564-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Scott Valley', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1566-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Seminole', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1567-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Big Cypress', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1568-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Brighton', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1569-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Florida Seminole', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1570-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hollywood Seminole', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1571-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oklahoma Seminole', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1573-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Serrano', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1574-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Manual', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1576-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shasta', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1578-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shawnee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1579-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Absentee Shawnee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1580-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eastern Shawnee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1582-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shinnecock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1584-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shoalwater Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1586-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shoshone', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1587-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Battle Mountain', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1588-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Duckwater', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1589-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Elko', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1590-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ely', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1591-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Goshute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1592-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Panamint', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1593-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ruby Valley', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1594-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Skull Valley', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1595-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'South Fork Shoshone', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1596-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Te-Moak Western Shoshone', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1597-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Timbi-Sha Shoshone', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1598-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Washakie', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1599-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wind River Shoshone', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1600-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yomba', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1602-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shoshone Paiute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1603-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Duck Valley', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1604-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fallon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1605-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort McDermitt', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1607-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Siletz', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1609-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1610-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Blackfoot Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1611-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Brule Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1612-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cheyenne River Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1613-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Crow Creek Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1614-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dakota Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1615-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Flandreau Santee', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1616-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Peck', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1617-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lake Traverse Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1618-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lower Brule Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1619-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lower Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1620-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mdewakanton Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1621-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Miniconjou', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1622-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oglala Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1623-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pine Ridge Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1624-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pipestone Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1625-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Prairie Island Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1626-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Prior Lake Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1627-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Rosebud Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1628-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sans Arc Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1629-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Santee Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1630-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sisseton-Wahpeton', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1631-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sisseton Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1632-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Spirit Lake Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1633-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Standing Rock Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1634-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Teton Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1635-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Two Kettle Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1636-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Upper Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1637-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wahpekute-Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1638-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wahpeton Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1639-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wazhaza Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1640-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yankton Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1641-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yanktonai Sioux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1643-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Siuslaw', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1645-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Spokane', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1647-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Stewart', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1649-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Stockbridge', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1651-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Susanville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1653-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tohono OOdham', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1654-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ak-Chin', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1655-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gila Bend', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1656-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'San Xavier', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1657-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sells', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1659-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tolowa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1661-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tonkawa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1663-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tygh', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1665-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Umatilla', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1667-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Umpqua', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1668-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cow Creek Umpqua', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1670-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1671-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Allen Canyon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1672-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Uinta Ute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1673-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ute Mountain Ute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1675-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wailaki', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1677-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Walla-Walla', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1679-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wampanoag', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1680-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gay Head Wampanoag', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1681-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mashpee Wampanoag', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1683-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Warm Springs', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1685-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wascopum', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1687-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Washoe', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1688-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alpine', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1689-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Carson', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1690-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dresslerville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1692-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wichita', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1694-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wind River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1696-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Winnebago', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1697-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ho-chunk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1698-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nebraska Winnebago', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1700-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Winnemucca', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1702-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wintun', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1704-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wiyot', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1705-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Table Bluff', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1707-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yakama', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1709-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yakama Cowlitz', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1711-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yaqui', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1712-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Barrio Libre', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1713-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pascua Yaqui', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1715-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yavapai Apache', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1717-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yokuts', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1718-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chukchansi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1719-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tachi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1720-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tule River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1722-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yuchi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1724-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yuman', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1725-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cocopah', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1726-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Havasupai', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1727-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hualapai', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1728-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Maricopa', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1729-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mohave', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1730-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Quechan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1731-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yavapai', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1732-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yurok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1733-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Coast Yurok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1735-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alaska Native', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1737-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alaska Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1739-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alaskan Athabascan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1740-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ahtna', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1741-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alatna', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1742-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alexander', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1743-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Allakaket', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1744-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alanvik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1745-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Anvik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1746-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Arctic', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1747-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Beaver', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1748-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Birch Creek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1749-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cantwell', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1750-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chalkyitsik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1751-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chickaloon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1752-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chistochina', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1753-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chitina', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1754-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Circle', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1755-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cook Inlet', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1756-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Copper Center', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1757-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Copper River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1758-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dot Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1759-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Doyon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1760-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eagle', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1761-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eklutna', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1762-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Evansville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1763-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fort Yukon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1764-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gakona', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1765-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Galena', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1766-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Grayling', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1767-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gulkana', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1768-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Healy Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1769-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Holy Cross', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1770-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hughes', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1771-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Huslia', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1772-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iliamna', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1773-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kaltag', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1774-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kluti Kaah', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1775-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Knik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1776-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Koyukuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1777-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lake Minchumina', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1778-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lime', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1779-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mcgrath', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1780-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Manley Hot Springs', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1781-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mentasta Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1782-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Minto', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1783-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nenana', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1784-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nikolai', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1785-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ninilchik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1786-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nondalton', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1787-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Northway', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1788-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nulato', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1789-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pedro Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1790-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Rampart', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1791-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ruby', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1792-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Salamatof', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1793-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Seldovia', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1794-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Slana', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1795-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shageluk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1796-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Stevens', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1797-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Stony River', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1798-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Takotna', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1799-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tanacross', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1800-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tanaina', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1801-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tanana', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1802-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tanana Chiefs', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1803-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tazlina', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1804-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Telida', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1805-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tetlin', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1806-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1807-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tyonek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1808-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Venetie', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1809-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wiseman', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1811-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Southeast Alaska', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1813-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tlingit-Haida', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1814-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Angoon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1815-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Central Council of Tlingit and Haida Tribes', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1816-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chilkat', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1817-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chilkoot', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1818-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Craig', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1819-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Douglas', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1820-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Haida', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1821-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hoonah', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1822-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hydaburg', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1823-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1824-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kasaan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1825-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kenaitze', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1826-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ketchikan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1827-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Klawock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1828-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pelican', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1829-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Petersburg', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1830-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Saxman', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1831-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sitka', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1832-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tenakee Springs', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1833-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tlingit', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1834-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wrangell', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1835-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yakutat', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1837-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tsimshian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1838-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Metlakatla', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1840-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eskimo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1842-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Greenland Eskimo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1844-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Inupiat Eskimo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1845-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ambler', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1846-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Anaktuvuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1847-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Anaktuvuk Pass', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1848-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Arctic Slope Inupiat', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1849-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Arctic Slope Corporation', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1850-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Atqasuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1851-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Barrow', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1852-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bering Straits Inupiat', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1853-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Brevig Misison', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1854-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Buckland', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1855-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chinik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1856-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Council', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1857-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Deering', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1858-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Elim', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1859-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Golovin', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1860-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Inalik Diomede', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1861-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Inupiaq', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1862-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kaktovik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1863-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kawerak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1864-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kiana', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1865-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kivalina', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1866-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kobuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1867-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kotzebue', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1868-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Koyuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1869-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kwiguk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1870-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mauneluk Inupiat', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1871-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nana Inupiat', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1872-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Noatak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1873-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nome', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1874-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Noorvik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1875-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nuiqsut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1876-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Point Hope', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1877-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Point Lay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1878-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Selawik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1879-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shaktoolik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1880-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shishmaref', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1881-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Shungnak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1882-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Solomon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1883-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Teller', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1884-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Unalakleet', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1885-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wainwright', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1886-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Wales', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1887-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'White Mountain', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1888-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'White Mountain Inupiat', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1889-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Marys Igloo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1891-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Siberian Eskimo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1892-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gambell', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1893-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Savoonga', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1894-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Siberian Yupik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1896-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yupik Eskimo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1897-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Akiachak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1898-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Akiak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1899-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alakanuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1900-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Aleknagik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1901-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Andreafsky', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1902-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Aniak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1903-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Atmautlauk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1904-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bethel', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1905-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bill Moores Slough', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1906-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bristol Bay Yupik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1907-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Calista Yupik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1908-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chefornak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1909-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chevak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1910-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chuathbaluk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1911-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Clarks Point', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1912-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Crooked Creek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1913-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dillingham', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1914-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1915-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ekuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1916-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ekwok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1917-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Emmonak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1918-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Goodnews Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1919-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hooper Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1920-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iqurmuit (Russian Mission)', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1921-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kalskag', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1922-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kasigluk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1923-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kipnuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1924-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Koliganek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1925-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kongiganak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1926-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kotlik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1927-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kwethluk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1928-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kwigillingok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1929-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Levelock', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1930-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lower Kalskag', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1931-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Manokotak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1932-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Marshall', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1933-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mekoryuk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1934-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mountain Village', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1935-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Naknek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1936-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Napaumute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1937-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Napakiak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1938-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Napaskiak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1939-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Newhalen', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1940-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'New Stuyahok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1941-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Newtok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1942-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nightmute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1943-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nunapitchukv', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1944-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Oscarville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1945-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pilot Station', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1946-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pitkas Point', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1947-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Platinum', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1948-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Portage Creek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1949-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Quinhagak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1950-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Red Devil', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1951-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'St. Michael', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1952-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Scammon Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1953-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sheldons Point', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1954-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sleetmute', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1955-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Stebbins', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1956-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Togiak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1957-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Toksook', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1958-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tulukskak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1959-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tuntutuliak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1960-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tununak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1961-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Twin Hills', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1962-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Georgetown (Yupik-Eskimo)', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1963-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'St. Marys', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1964-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Umkumiate', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1966-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Aleut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1968-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Alutiiq Aleut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1969-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tatitlek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1970-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ugashik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1972-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bristol Bay Aleut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1973-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chignik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1974-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chignik Lake', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1975-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Egegik', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1976-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Igiugig', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1977-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ivanof Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1978-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'King Salmon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1979-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kokhanok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1980-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Perryville', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1981-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pilot Point', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1982-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Port Heiden', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1984-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chugach Aleut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1985-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chenega', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1986-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chugach Corporation', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1987-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'English Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1988-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Port Graham', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1990-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Eyak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1992-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Koniag Aleut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1993-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Akhiok', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1994-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Agdaagux', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1995-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Karluk', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1996-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kodiak', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1997-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Larsen Bay', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1998-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Old Harbor', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('1999-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ouzinkie', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2000-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Port Lions', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2002-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sugpiaq', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2004-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Suqpigaq', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2006-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Unangan Aleut', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2007-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Akutan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2008-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Aleut Corporation', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2009-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Aleutian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2010-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Aleutian Islander', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2011-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Atka', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2012-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Belkofski', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2013-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chignik Lagoon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2014-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'King Cove', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2015-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'False Pass', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2016-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nelson Lagoon', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2017-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nikolski', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2018-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pauloff Harbor', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2019-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Qagan Toyagungin', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2020-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Qawalangin', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2021-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'St. George', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2022-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'St. Paul', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2023-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sand Point', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2024-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'South Naknek', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2025-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Unalaska', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2026-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Unga', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2028-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Asian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2029-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Asian Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2030-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bangladeshi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2031-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bhutanese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2032-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Burmese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2033-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cambodian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2034-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chinese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2035-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Taiwanese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2036-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Filipino', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2037-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hmong', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2038-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Indonesian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2039-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Japanese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2040-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Korean', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2041-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Laotian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2042-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Malaysian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2043-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Okinawan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2044-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pakistani', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2045-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Sri Lankan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2046-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Thai', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2047-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Vietnamese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2048-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iwo Jiman', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2049-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Maldivian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2050-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nepalese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2051-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Singaporean', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2052-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Madagascar', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2054-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Black or African American', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2056-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Black', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2058-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'African American', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2060-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'African', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2061-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Botswanan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2062-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ethiopian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2063-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Liberian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2064-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Namibian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2065-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nigerian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2066-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Zairean', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2067-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bahamian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2068-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Barbadian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2069-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dominican', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2070-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dominica Islander', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2071-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Haitian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2072-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Jamaican', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2073-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tobagoan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2074-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Trinidadian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2075-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'West Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2076-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Native Hawaiian or Other Pacific Islander', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2078-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Polynesian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2079-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Native Hawaiian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2080-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Samoan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2081-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tahitian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2082-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tongan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2083-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Tokelauan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2085-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Micronesian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2086-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Guamanian or Chamorro', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2087-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Guamanian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2088-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chamorro', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2089-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mariana Islander', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2090-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Marshallese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2091-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Palauan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2092-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Carolinian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2093-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kosreaan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2094-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Pohnpeian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2095-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Saipanese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2096-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Kiribati', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2097-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chuukese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2098-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Yapese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2100-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Melanesian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2101-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Fijian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2102-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Papua New Guinean', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2103-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Solomon Islander', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2104-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'New Hebrides', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2106-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'White', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2108-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'European', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2109-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Armenian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2110-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'English', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2111-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'French', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2112-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'German', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2113-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Irish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2114-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Italian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2115-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Polish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2116-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Scottish', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2118-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Middle Eastern or North African', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2119-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Assyrian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2120-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Egyptian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2121-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iranian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2122-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Iraqi', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2123-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Lebanese', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2124-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Palestinian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2125-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Syrian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2126-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Afghanistani', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2127-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Israeli', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2129-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Arab', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2131-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Other Race', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2133-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ethnicity', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2135-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Hispanic or Latino', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2137-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Spaniard', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2138-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Andalusian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2139-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Asturian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2140-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Castillian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2141-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Catalonian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2142-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Balearic Islander', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2143-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Gallego', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2144-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Valencian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2145-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Canarian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2146-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Spanish Basque', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2148-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mexican', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2149-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mexican American', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2150-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mexicano', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2151-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chicano', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2152-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'La Raza', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2153-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Mexican American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2155-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Central American', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2156-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Costa Rican', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2157-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Guatemalan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2158-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Honduran', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2159-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Nicaraguan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2160-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Panamanian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2161-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Salvadoran', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2162-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Central American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2163-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Canal Zone', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2165-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'South American', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2166-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Argentinean', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2167-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Bolivian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2168-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Chilean', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2169-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Colombian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2170-9', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Ecuadorian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2171-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Paraguayan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2172-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Peruvian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2173-3', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Uruguayan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2174-1', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Venezuelan', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2175-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'South American Indian', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2176-6', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Criollo', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2178-2', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Latin American', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2180-8', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Puerto Rican', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2182-4', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Cuban', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2184-0', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Dominican', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2186-5', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Not Hispanic or Latino', 1)
GO
INSERT INTO eICR_race_ethnicity_codes
            VALUES('2500-7', '2.16.840.1.113883.6.238', 'Race & Ethnicity - CDC', 'Other Pacific Islander', 1)
GO

-- Creates a table for storing trigger code VALUES
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eICR_trigger_codes](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](25) NULL,
	[code_system] [varchar](50) NULL,
	[code_system_name] [varchar](50) NULL,
	[display_name] [varchar](255) NULL,
	[OID] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

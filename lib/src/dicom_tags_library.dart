const dicomLibraryData = """(0002,0000);UL;File Meta Information Group Length
(0002,0001);OB;File Meta Information Version
(0002,0002);UI;Media Storage SOP Class UID
(0002,0003);UI;Media Storage SOP Instance UID
(0002,0010);UI;Transfer Syntax UID
(0002,0012);UI;Implementation Class UID
(0002,0013);SH;Implementation Version Name
(0002,0016);AE;Source Application Entity Title
(0002,0017);AE;Sending Application Entity Title
(0002,0018);AE;Receiving Application Entity Title
(0002,0100);UI;Private Information Creator UID
(0002,0102);OB;Private Information
(0004,1130);CS;File-set ID
(0004,1141);CS;File-set Descriptor File ID
(0004,1142);CS;Specific Character Set of File-set Descriptor File
(0004,1200);UL;Offset of the First Directory Record of the Root Directory Entity
(0004,1202);UL;Offset of the Last Directory Record of the Root Directory Entity
(0004,1212);US;File-set Consistency Flag
(0004,1220);SQ;Directory Record Sequence
(0004,1400);UL;Offset of the Next Directory Record
(0004,1410);US;Record In-use Flag
(0004,1420);UL;Offset of Referenced Lower-Level Directory Entity
(0004,1430);CS;Directory Record Type
(0004,1432);UI;Private Record UID
(0004,1500);CS;Referenced File ID
(0004,1504);UL;MRDR Directory Record Offset
(0004,1510);UI;Referenced SOP Class UID in File
(0004,1511);UI;Referenced SOP Instance UID in File
(0004,1512);UI;Referenced Transfer Syntax UID in File
(0004,151A);UI;Referenced Related General SOP Class UID in File
(0004,1600);UL;Number of References
(0008,0001);UL;Length to End
(0008,0005);CS;Specific Character Set
(0008,0006);SQ;Language Code Sequence
(0008,0008);CS;Image Type
(0008,0010);SH;Recognition Code
(0008,0012);DA;Instance Creation Date
(0008,0013);TM;Instance Creation Time
(0008,0014);UI;Instance Creator UID
(0008,0015);DT;Instance Coercion DateTime
(0008,0016);UI;SOP Class UID
(0008,0018);UI;SOP Instance UID
(0008,001A);UI;Related General SOP Class UID
(0008,001B);UI;Original Specialized SOP Class UID
(0008,0020);DA;Study Date
(0008,0021);DA;Series Date
(0008,0022);DA;Acquisition Date
(0008,0023);DA;Content Date
(0008,0024);DA;Overlay Date
(0008,0025);DA;Curve Date
(0008,002A);DT;Acquisition DateTime
(0008,0030);TM;Study Time
(0008,0031);TM;Series Time
(0008,0032);TM;Acquisition Time
(0008,0033);TM;Content Time
(0008,0034);TM;Overlay Time
(0008,0035);TM;Curve Time
(0008,0040);US;Data Set Type
(0008,0041);LO;Data Set Subtype
(0008,0042);CS;Nuclear Medicine Series Type
(0008,0050);SH;Accession Number
(0008,0051);SQ;Issuer of Accession Number Sequence
(0008,0052);CS;Query/Retrieve Level
(0008,0053);CS;Query/Retrieve View
(0008,0054);AE;Retrieve AE Title
(0008,0055);AE;Station AE Title
(0008,0056);CS;Instance Availability
(0008,0058);UI;Failed SOP Instance UID List
(0008,0060);CS;Modality
(0008,0061);CS;Modalities in Study
(0008,0062);UI;SOP Classes in Study
(0008,0064);CS;Conversion Type
(0008,0068);CS;Presentation Intent Type
(0008,0070);LO;Manufacturer
(0008,0080);LO;Institution Name
(0008,0081);ST;Institution Address
(0008,0082);SQ;Institution Code Sequence
(0008,0090);PN;Referring Physician's Name
(0008,0092);ST;Referring Physician's Address
(0008,0094);SH;Referring Physician's Telephone Numbers
(0008,0096);SQ;Referring Physician Identification Sequence
(0008,009C);PN;Consulting Physician's Name
(0008,009D);SQ;Consulting Physician Identification Sequence
(0008,0100);SH;Code Value
(0008,0101);LO;Extended Code Value
(0008,0102);SH;Coding Scheme Designator
(0008,0103);SH;Coding Scheme Version
(0008,0104);LO;Code Meaning
(0008,0105);CS;Mapping Resource
(0008,0106);DT;Context Group Version
(0008,0107);DT;Context Group Local Version
(0008,0108);LT;Extended Code Meaning
(0008,010B);CS;Context Group Extension Flag
(0008,010C);UI;Coding Scheme UID
(0008,010D);UI;Context Group Extension Creator UID
(0008,010F);CS;Context Identifier
(0008,0110);SQ;Coding Scheme Identification Sequence
(0008,0112);LO;Coding Scheme Registry
(0008,0114);ST;Coding Scheme External ID
(0008,0115);ST;Coding Scheme Name
(0008,0116);ST;Coding Scheme Responsible Organization
(0008,0117);UI;Context UID
(0008,0118);UI;Mapping Resource UID
(0008,0119);UC;Long Code Value
(0008,0120);UR;URN Code Value
(0008,0121);SQ;Equivalent Code Sequence
(0008,0122);LO;Mapping Resource Name
(0008,0123);SQ;Context Group Identification Sequence
(0008,0124);SQ;Mapping Resource Identification Sequence
(0008,0201);SH;Timezone Offset From UTC
(0008,0300);SQ;Private Data Element Characteristics Sequence
(0008,0301);US;Private Group Reference
(0008,0302);LO;Private Creator Reference
(0008,0303);CS;Block Identifying Information Status
(0008,0304);US;Nonidentifying Private Elements
(0008,0306);US;Identifying Private Elements
(0008,0305);SQ;Deidentification Action Sequence
(0008,0307);CS;Deidentification Action
(0008,1000);AE;Network ID
(0008,1010);SH;Station Name
(0008,1030);LO;Study Description
(0008,1032);SQ;Procedure Code Sequence
(0008,103E);LO;Series Description
(0008,103F);SQ;Series Description Code Sequence
(0008,1040);LO;Institutional Department Name
(0008,1048);PN;Physician(s) of Record
(0008,1049);SQ;Physician(s) of Record Identification Sequence
(0008,1050);PN;Performing Physician's Name
(0008,1052);SQ;Performing Physician Identification Sequence
(0008,1060);PN;Name of Physician(s) Reading Study
(0008,1062);SQ;Physician(s) Reading Study Identification Sequence
(0008,1070);PN;Operators' Name
(0008,1072);SQ;Operator Identification Sequence
(0008,1080);LO;Admitting Diagnoses Description
(0008,1084);SQ;Admitting Diagnoses Code Sequence
(0008,1090);LO;Manufacturer's Model Name
(0008,1100);SQ;Referenced Results Sequence
(0008,1110);SQ;Referenced Study Sequence
(0008,1111);SQ;Referenced Performed Procedure Step Sequence
(0008,1115);SQ;Referenced Series Sequence
(0008,1120);SQ;Referenced Patient Sequence
(0008,1125);SQ;Referenced Visit Sequence
(0008,1130);SQ;Referenced Overlay Sequence
(0008,1134);SQ;Referenced Stereometric Instance Sequence
(0008,113A);SQ;Referenced Waveform Sequence
(0008,1140);SQ;Referenced Image Sequence
(0008,1145);SQ;Referenced Curve Sequence
(0008,114A);SQ;Referenced Instance Sequence
(0008,114B);SQ;Referenced Real World Value Mapping Instance Sequence
(0008,1150);UI;Referenced SOP Class UID
(0008,1155);UI;Referenced SOP Instance UID
(0008,115A);UI;SOP Classes Supported
(0008,1160);IS;Referenced Frame Number
(0008,1161);UL;Simple Frame List
(0008,1162);UL;Calculated Frame List
(0008,1163);FD;Time Range
(0008,1164);SQ;Frame Extraction Sequence
(0008,1167);UI;Multi-frame Source SOP Instance UID
(0008,1190);UR;Retrieve URL
(0008,1195);UI;Transaction UID
(0008,1196);US;Warning Reason
(0008,1197);US;Failure Reason
(0008,1198);SQ;Failed SOP Sequence
(0008,1199);SQ;Referenced SOP Sequence
(0008,119A);SQ;Other Failures Sequence
(0008,1200);SQ;Studies Containing Other Referenced Instances Sequence
(0008,1250);SQ;Related Series Sequence
(0008,2110);CS;Lossy Image Compression (Retired)
(0008,2111);ST;Derivation Description
(0008,2112);SQ;Source Image Sequence
(0008,2120);SH;Stage Name
(0008,2122);IS;Stage Number
(0008,2124);IS;Number of Stages
(0008,2127);SH;View Name
(0008,2128);IS;View Number
(0008,2129);IS;Number of Event Timers
(0008,212A);IS;Number of Views in Stage
(0008,2130);DS;Event Elapsed Time(s)
(0008,2132);LO;Event Timer Name(s)
(0008,2133);SQ;Event Timer Sequence
(0008,2134);FD;Event Time Offset
(0008,2135);SQ;Event Code Sequence
(0008,2142);IS;Start Trim
(0008,2143);IS;Stop Trim
(0008,2144);IS;Recommended Display Frame Rate
(0008,2200);CS;Transducer Position
(0008,2204);CS;Transducer Orientation
(0008,2208);CS;Anatomic Structure
(0008,2218);SQ;Anatomic Region Sequence
(0008,2220);SQ;Anatomic Region Modifier Sequence
(0008,2228);SQ;Primary Anatomic Structure Sequence
(0008,2229);SQ;Anatomic Structure, Space or Region Sequence
(0008,2230);SQ;Primary Anatomic Structure Modifier Sequence
(0008,2240);SQ;Transducer Position Sequence
(0008,2242);SQ;Transducer Position Modifier Sequence
(0008,2244);SQ;Transducer Orientation Sequence
(0008,2246);SQ;Transducer Orientation Modifier Sequence
(0008,2251);SQ;Anatomic Structure Space Or Region Code Sequence (Trial)
(0008,2253);SQ;Anatomic Portal Of Entrance Code Sequence (Trial)
(0008,2255);SQ;Anatomic Approach Direction Code Sequence (Trial)
(0008,2256);ST;Anatomic Perspective Description (Trial)
(0008,2257);SQ;Anatomic Perspective Code Sequence (Trial)
(0008,2258);ST;Anatomic Location Of Examining Instrument Description (Trial)
(0008,2259);SQ;Anatomic Location Of Examining Instrument Code Sequence (Trial)
(0008,225A);SQ;Anatomic Structure Space Or Region Modifier Code Sequence (Trial)
(0008,225C);SQ;On Axis Background Anatomic Structure Code Sequence (Trial)
(0008,3001);SQ;Alternate Representation Sequence
(0008,3010);UI;Irradiation Event UID
(0008,3011);SQ;Source Irradiation Event Sequence
(0008,3012);UI;Radiopharmaceutical Administration Event UID
(0008,4000);LT;Identifying Comments
(0008,9007);CS;Frame Type
(0008,9092);SQ;Referenced Image Evidence Sequence
(0008,9121);SQ;Referenced Raw Data Sequence
(0008,9123);UI;Creator-Version UID
(0008,9124);SQ;Derivation Image Sequence
(0008,9154);SQ;Source Image Evidence Sequence
(0008,9205);CS;Pixel Presentation
(0008,9206);CS;Volumetric Properties
(0008,9207);CS;Volume Based Calculation Technique
(0008,9208);CS;Complex Image Component
(0008,9209);CS;Acquisition Contrast
(0008,9215);SQ;Derivation Code Sequence
(0008,9237);SQ;Referenced Presentation State Sequence
(0008,9410);SQ;Referenced Other Plane Sequence
(0008,9458);SQ;Frame Display Sequence
(0008,9459);FL;Recommended Display Frame Rate in Float
(0008,9460);CS;Skip Frame Range Flag
(0010,0010);PN;Patient's Name
(0010,0020);LO;Patient ID
(0010,0021);LO;Issuer of Patient ID
(0010,0022);CS;Type of Patient ID
(0010,0024);SQ;Issuer of Patient ID Qualifiers Sequence
(0010,0026);SQ;Source Patient Group Identification Sequence
(0010,0027);SQ;Group of Patients Identification Sequence
(0010,0028);US;Subject Relative Position in Image
(0010,0030);DA;Patient's Birth Date
(0010,0032);TM;Patient's Birth Time
(0010,0033);LO;Patient's Birth Date in Alternative Calendar
(0010,0034);LO;Patient's Death Date in Alternative Calendar
(0010,0035);CS;Patient's Alternative Calendar
(0010,0040);CS;Patient's Sex
(0010,0050);SQ;Patient's Insurance Plan Code Sequence
(0010,0101);SQ;Patient's Primary Language Code Sequence
(0010,0102);SQ;Patient's Primary Language Modifier Code Sequence
(0010,0200);CS;Quality Control Subject
(0010,0201);SQ;Quality Control Subject Type Code Sequence
(0010,0212);UC;Strain Description
(0010,0213);LO;Strain Nomenclature
(0010,0214);LO;Strain Stock Number
(0010,0215);SQ;Strain Source Registry Code Sequence
(0010,0216);SQ;Strain Stock Sequence
(0010,0217);LO;Strain Source
(0010,0218);UT;Strain Additional Information
(0010,0219);SQ;Strain Code Sequence
(0010,1000);LO;Other Patient IDs
(0010,1001);PN;Other Patient Names
(0010,1002);SQ;Other Patient IDs Sequence
(0010,1005);PN;Patient's Birth Name
(0010,1010);AS;Patient's Age
(0010,1020);DS;Patient's Size
(0010,1021);SQ;Patient's Size Code Sequence
(0010,1030);DS;Patient's Weight
(0010,1040);LO;Patient's Address
(0010,1050);LO;Insurance Plan Identification
(0010,1060);PN;Patient's Mother's Birth Name
(0010,1080);LO;Military Rank
(0010,1081);LO;Branch of Service
(0010,1090);LO;Medical Record Locator
(0010,1100);SQ;Referenced Patient Photo Sequence
(0010,2000);LO;Medical Alerts
(0010,2110);LO;Allergies
(0010,2150);LO;Country of Residence
(0010,2152);LO;Region of Residence
(0010,2154);SH;Patient's Telephone Numbers
(0010,2155);LT;Patient's Telecom Information
(0010,2160);SH;Ethnic Group
(0010,2180);SH;Occupation
(0010,21A0);CS;Smoking Status
(0010,21B0);LT;Additional Patient History
(0010,21C0);US;Pregnancy Status
(0010,21D0);DA;Last Menstrual Date
(0010,21F0);LO;Patient's Religious Preference
(0010,2201);LO;Patient Species Description
(0010,2202);SQ;Patient Species Code Sequence
(0010,2203);CS;Patient's Sex Neutered
(0010,2210);CS;Anatomical Orientation Type
(0010,2292);LO;Patient Breed Description
(0010,2293);SQ;Patient Breed Code Sequence
(0010,2294);SQ;Breed Registration Sequence
(0010,2295);LO;Breed Registration Number
(0010,2296);SQ;Breed Registry Code Sequence
(0010,2297);PN;Responsible Person
(0010,2298);CS;Responsible Person Role
(0010,2299);LO;Responsible Organization
(0010,4000);LT;Patient Comments
(0010,9431);FL;Examined Body Thickness
(0012,0010);LO;Clinical Trial Sponsor Name
(0012,0020);LO;Clinical Trial Protocol ID
(0012,0021);LO;Clinical Trial Protocol Name
(0012,0030);LO;Clinical Trial Site ID
(0012,0031);LO;Clinical Trial Site Name
(0012,0040);LO;Clinical Trial Subject ID
(0012,0042);LO;Clinical Trial Subject Reading ID
(0012,0050);LO;Clinical Trial Time Point ID
(0012,0051);ST;Clinical Trial Time Point Description
(0012,0060);LO;Clinical Trial Coordinating Center Name
(0012,0062);CS;Patient Identity Removed
(0012,0063);LO;De-identification Method
(0012,0064);SQ;De-identification Method Code Sequence
(0012,0071);LO;Clinical Trial Series ID
(0012,0072);LO;Clinical Trial Series Description
(0012,0081);LO;Clinical Trial Protocol Ethics Committee Name
(0012,0082);LO;Clinical Trial Protocol Ethics Committee Approval Number
(0012,0083);SQ;Consent for Clinical Trial Use Sequence
(0012,0084);CS;Distribution Type
(0012,0085);CS;Consent for Distribution Flag
(0014,0023);ST;CAD File Format
(0014,0024);ST;Component Reference System
(0014,0025);ST;Component Manufacturing Procedure
(0014,0028);ST;Component Manufacturer
(0014,0030);DS;Material Thickness
(0014,0032);DS;Material Pipe Diameter
(0014,0034);DS;Material Isolation Diameter
(0014,0042);ST;Material Grade
(0014,0044);ST;Material Properties Description
(0014,0045);ST;Material Properties File Format (Retired)
(0014,0046);LT;Material Notes
(0014,0050);CS;Component Shape
(0014,0052);CS;Curvature Type
(0014,0054);DS;Outer Diameter
(0014,0056);DS;Inner Diameter
(0014,0100);LO;Component Welder IDs
(0014,0101);CS;Secondary Approval Status
(0014,0102);DA;Secondary Review Date
(0014,0103);TM;Secondary Review Time
(0014,0104);PN;Secondary Reviewer Name
(0014,0105);ST;Repair ID
(0014,0106);SQ;Multiple Component Approval Sequence
(0014,0107);CS;Other Approval Status
(0014,0108);CS;Other Secondary Approval Status
(0014,1010);ST;Actual Environmental Conditions
(0014,1020);DA;Expiry Date
(0014,1040);ST;Environmental Conditions
(0014,2002);SQ;Evaluator Sequence
(0014,2004);IS;Evaluator Number
(0014,2006);PN;Evaluator Name
(0014,2008);IS;Evaluation Attempt
(0014,2012);SQ;Indication Sequence
(0014,2014);IS;Indication Number
(0014,2016);SH;Indication Label
(0014,2018);ST;Indication Description
(0014,201A);CS;Indication Type
(0014,201C);CS;Indication Disposition
(0014,201E);SQ;Indication ROI Sequence
(0014,2030);SQ;Indication Physical Property Sequence
(0014,2032);SH;Property Label
(0014,2202);IS;Coordinate System Number of Axes
(0014,2204);SQ;Coordinate System Axes Sequence
(0014,2206);ST;Coordinate System Axis Description
(0014,2208);CS;Coordinate System Data Set Mapping
(0014,220A);IS;Coordinate System Axis Number
(0014,220C);CS;Coordinate System Axis Type
(0014,220E);CS;Coordinate System Axis Units
(0014,2210);OB;Coordinate System Axis Values
(0014,2220);SQ;Coordinate System Transform Sequence
(0014,2222);ST;Transform Description
(0014,2224);IS;Transform Number of Axes
(0014,2226);IS;Transform Order of Axes
(0014,2228);CS;Transformed Axis Units
(0014,222A);DS;Coordinate System Transform Rotation and Scale Matrix
(0014,222C);DS;Coordinate System Transform Translation Matrix
(0014,3011);DS;Internal Detector Frame Time
(0014,3012);DS;Number of Frames Integrated
(0014,3020);SQ;Detector Temperature Sequence
(0014,3022);ST;Sensor Name
(0014,3024);DS;Horizontal Offset of Sensor
(0014,3026);DS;Vertical Offset of Sensor
(0014,3028);DS;Sensor Temperature
(0014,3040);SQ;Dark Current Sequence
(0014,3050);OB or OW;Dark Current Counts
(0014,3060);SQ;Gain Correction Reference Sequence
(0014,3070);OB or OW;Air Counts
(0014,3071);DS;KV Used in Gain Calibration
(0014,3072);DS;MA Used in Gain Calibration
(0014,3073);DS;Number of Frames Used for Integration
(0014,3074);LO;Filter Material Used in Gain Calibration
(0014,3075);DS;Filter Thickness Used in Gain Calibration
(0014,3076);DA;Date of Gain Calibration
(0014,3077);TM;Time of Gain Calibration
(0014,3080);OB;Bad Pixel Image
(0014,3099);LT;Calibration Notes
(0014,4002);SQ;Pulser Equipment Sequence
(0014,4004);CS;Pulser Type
(0014,4006);LT;Pulser Notes
(0014,4008);SQ;Receiver Equipment Sequence
(0014,400A);CS;Amplifier Type
(0014,400C);LT;Receiver Notes
(0014,400E);SQ;Pre-Amplifier Equipment Sequence
(0014,400F);LT;Pre-Amplifier Notes
(0014,4010);SQ;Transmit Transducer Sequence
(0014,4011);SQ;Receive Transducer Sequence
(0014,4012);US;Number of Elements
(0014,4013);CS;Element Shape
(0014,4014);DS;Element Dimension A
(0014,4015);DS;Element Dimension B
(0014,4016);DS;Element Pitch A
(0014,4017);DS;Measured Beam Dimension A
(0014,4018);DS;Measured Beam Dimension B
(0014,4019);DS;Location of Measured Beam Diameter
(0014,401A);DS;Nominal Frequency
(0014,401B);DS;Measured Center Frequency
(0014,401C);DS;Measured Bandwidth
(0014,401D);DS;Element Pitch B
(0014,4020);SQ;Pulser Settings Sequence
(0014,4022);DS;Pulse Width
(0014,4024);DS;Excitation Frequency
(0014,4026);CS;Modulation Type
(0014,4028);DS;Damping
(0014,4030);SQ;Receiver Settings Sequence
(0014,4031);DS;Acquired Soundpath Length
(0014,4032);CS;Acquisition Compression Type
(0014,4033);IS;Acquisition Sample Size
(0014,4034);DS;Rectifier Smoothing
(0014,4035);SQ;DAC Sequence
(0014,4036);CS;DAC Type
(0014,4038);DS;DAC Gain Points
(0014,403A);DS;DAC Time Points
(0014,403C);DS;DAC Amplitude
(0014,4040);SQ;Pre-Amplifier Settings Sequence
(0014,4050);SQ;Transmit Transducer Settings Sequence
(0014,4051);SQ;Receive Transducer Settings Sequence
(0014,4052);DS;Incident Angle
(0014,4054);ST;Coupling Technique
(0014,4056);ST;Coupling Medium
(0014,4057);DS;Coupling Velocity
(0014,4058);DS;Probe Center Location X
(0014,4059);DS;Probe Center Location Z
(0014,405A);DS;Sound Path Length
(0014,405C);ST;Delay Law Identifier
(0014,4060);SQ;Gate Settings Sequence
(0014,4062);DS;Gate Threshold
(0014,4064);DS;Velocity of Sound
(0014,4070);SQ;Calibration Settings Sequence
(0014,4072);ST;Calibration Procedure
(0014,4074);SH;Procedure Version
(0014,4076);DA;Procedure Creation Date
(0014,4078);DA;Procedure Expiration Date
(0014,407A);DA;Procedure Last Modified Date
(0014,407C);TM;Calibration Time
(0014,407E);DA;Calibration Date
(0014,4080);SQ;Probe Drive Equipment Sequence
(0014,4081);CS;Drive Type
(0014,4082);LT;Probe Drive Notes
(0014,4083);SQ;Drive Probe Sequence
(0014,4084);DS;Probe Inductance
(0014,4085);DS;Probe Resistance
(0014,4086);SQ;Receive Probe Sequence
(0014,4087);SQ;Probe Drive Settings Sequence
(0014,4088);DS;Bridge Resistors
(0014,4089);DS;Probe Orientation Angle
(0014,408B);DS;User Selected Gain Y
(0014,408C);DS;User Selected Phase
(0014,408D);DS;User Selected Offset X
(0014,408E);DS;User Selected Offset Y
(0014,4091);SQ;Channel Settings Sequence
(0014,4092);DS;Channel Threshold
(0014,409A);SQ;Scanner Settings Sequence
(0014,409B);ST;Scan Procedure
(0014,409C);DS;Translation Rate X
(0014,409D);DS;Translation Rate Y
(0014,409F);DS;Channel Overlap
(0014,40A0);LO;Image Quality Indicator Type
(0014,40A1);LO;Image Quality Indicator Material
(0014,40A2);LO;Image Quality Indicator Size
(0014,5002);IS;LINAC Energy
(0014,5004);IS;LINAC Output
(0014,5100);US;Active Aperture
(0014,5101);DS;Total Aperture
(0014,5102);DS;Aperture Elevation
(0014,5103);DS;Main Lobe Angle
(0014,5104);DS;Main Roof Angle
(0014,5105);CS;Connector Type
(0014,5106);SH;Wedge Model Number
(0014,5107);DS;Wedge Angle Float
(0014,5108);DS;Wedge Roof Angle
(0014,5109);CS;Wedge Element 1 Position
(0014,510A);DS;Wedge Material Velocity
(0014,510B);SH;Wedge Material
(0014,510C);DS;Wedge Offset Z
(0014,510D);DS;Wedge Origin Offset X
(0014,510E);DS;Wedge Time Delay
(0014,510F);SH;Wedge Name
(0014,5110);SH;Wedge Manufacturer Name
(0014,5111);LO;Wedge Description
(0014,5112);DS;Nominal Beam Angle
(0014,5113);DS;Wedge Offset X
(0014,5114);DS;Wedge Offset Y
(0014,5115);DS;Wedge Total Length
(0014,5116);DS;Wedge In Contact Length
(0014,5117);DS;Wedge Front Gap
(0014,5118);DS;Wedge Total Height
(0014,5119);DS;Wedge Front Height
(0014,511A);DS;Wedge Rear Height
(0014,511B);DS;Wedge Total Width
(0014,511C);DS;Wedge In Contact Width
(0014,511D);DS;Wedge Chamfer Height
(0014,511E);CS;Wedge Curve
(0014,511F);DS;Radius Along the Wedge
(0018,0010);LO;Contrast/Bolus Agent
(0018,0012);SQ;Contrast/Bolus Agent Sequence
(0018,0013);FL;Contrast/Bolus T1 Relaxivity
(0018,0014);SQ;Contrast/Bolus Administration Route Sequence
(0018,0015);CS;Body Part Examined
(0018,0020);CS;Scanning Sequence
(0018,0021);CS;Sequence Variant
(0018,0022);CS;Scan Options
(0018,0023);CS;MR Acquisition Type
(0018,0024);SH;Sequence Name
(0018,0025);CS;Angio Flag
(0018,0026);SQ;Intervention Drug Information Sequence
(0018,0027);TM;Intervention Drug Stop Time
(0018,0028);DS;Intervention Drug Dose
(0018,0029);SQ;Intervention Drug Code Sequence
(0018,002A);SQ;Additional Drug Sequence
(0018,0030);LO;Radionuclide
(0018,0031);LO;Radiopharmaceutical
(0018,0032);DS;Energy Window Centerline
(0018,0033);DS;Energy Window Total Width
(0018,0034);LO;Intervention Drug Name
(0018,0035);TM;Intervention Drug Start Time
(0018,0036);SQ;Intervention Sequence
(0018,0037);CS;Therapy Type
(0018,0038);CS;Intervention Status
(0018,0039);CS;Therapy Description
(0018,003A);ST;Intervention Description
(0018,0040);IS;Cine Rate
(0018,0042);CS;Initial Cine Run State
(0018,0050);DS;Slice Thickness
(0018,0060);DS;KVP
(0018,0070);IS;Counts Accumulated
(0018,0071);CS;Acquisition Termination Condition
(0018,0072);DS;Effective Duration
(0018,0073);CS;Acquisition Start Condition
(0018,0074);IS;Acquisition Start Condition Data
(0018,0075);IS;Acquisition Termination Condition Data
(0018,0080);DS;Repetition Time
(0018,0081);DS;Echo Time
(0018,0082);DS;Inversion Time
(0018,0083);DS;Number of Averages
(0018,0084);DS;Imaging Frequency
(0018,0085);SH;Imaged Nucleus
(0018,0086);IS;Echo Number(s)
(0018,0087);DS;Magnetic Field Strength
(0018,0088);DS;Spacing Between Slices
(0018,0089);IS;Number of Phase Encoding Steps
(0018,0090);DS;Data Collection Diameter
(0018,0091);IS;Echo Train Length
(0018,0093);DS;Percent Sampling
(0018,0094);DS;Percent Phase Field of View
(0018,0095);DS;Pixel Bandwidth
(0018,1000);LO;Device Serial Number
(0018,1002);UI;Device UID
(0018,1003);LO;Device ID
(0018,1004);LO;Plate ID
(0018,1005);LO;Generator ID
(0018,1006);LO;Grid ID
(0018,1007);LO;Cassette ID
(0018,1008);LO;Gantry ID
(0018,1010);LO;Secondary Capture Device ID
(0018,1011);LO;Hardcopy Creation Device ID
(0018,1012);DA;Date of Secondary Capture
(0018,1014);TM;Time of Secondary Capture
(0018,1016);LO;Secondary Capture Device Manufacturer
(0018,1017);LO;Hardcopy Device Manufacturer
(0018,1018);LO;Secondary Capture Device Manufacturer's Model Name
(0018,1019);LO;Secondary Capture Device Software Versions
(0018,101A);LO;Hardcopy Device Software Version
(0018,101B);LO;Hardcopy Device Manufacturer's Model Name
(0018,1020);LO;Software Version(s)
(0018,1022);SH;Video Image Format Acquired
(0018,1023);LO;Digital Image Format Acquired
(0018,1030);LO;Protocol Name
(0018,1040);LO;Contrast/Bolus Route
(0018,1041);DS;Contrast/Bolus Volume
(0018,1042);TM;Contrast/Bolus Start Time
(0018,1043);TM;Contrast/Bolus Stop Time
(0018,1044);DS;Contrast/Bolus Total Dose
(0018,1045);IS;Syringe Counts
(0018,1046);DS;Contrast Flow Rate
(0018,1047);DS;Contrast Flow Duration
(0018,1048);CS;Contrast/Bolus Ingredient
(0018,1049);DS;Contrast/Bolus Ingredient Concentration
(0018,1050);DS;Spatial Resolution
(0018,1060);DS;Trigger Time
(0018,1061);LO;Trigger Source or Type
(0018,1062);IS;Nominal Interval
(0018,1063);DS;Frame Time
(0018,1064);LO;Cardiac Framing Type
(0018,1065);DS;Frame Time Vector
(0018,1066);DS;Frame Delay
(0018,1067);DS;Image Trigger Delay
(0018,1068);DS;Multiplex Group Time Offset
(0018,1069);DS;Trigger Time Offset
(0018,106A);CS;Synchronization Trigger
(0018,106C);US;Synchronization Channel
(0018,106E);UL;Trigger Sample Position
(0018,1070);LO;Radiopharmaceutical Route
(0018,1071);DS;Radiopharmaceutical Volume
(0018,1072);TM;Radiopharmaceutical Start Time
(0018,1073);TM;Radiopharmaceutical Stop Time
(0018,1074);DS;Radionuclide Total Dose
(0018,1075);DS;Radionuclide Half Life
(0018,1076);DS;Radionuclide Positron Fraction
(0018,1077);DS;Radiopharmaceutical Specific Activity
(0018,1078);DT;Radiopharmaceutical Start DateTime
(0018,1079);DT;Radiopharmaceutical Stop DateTime
(0018,1080);CS;Beat Rejection Flag
(0018,1081);IS;Low R-R Value
(0018,1082);IS;High R-R Value
(0018,1083);IS;Intervals Acquired
(0018,1084);IS;Intervals Rejected
(0018,1085);LO;PVC Rejection
(0018,1086);IS;Skip Beats
(0018,1088);IS;Heart Rate
(0018,1090);IS;Cardiac Number of Images
(0018,1094);IS;Trigger Window
(0018,1100);DS;Reconstruction Diameter
(0018,1110);DS;Distance Source to Detector
(0018,1111);DS;Distance Source to Patient
(0018,1114);DS;Estimated Radiographic Magnification Factor
(0018,1120);DS;Gantry/Detector Tilt
(0018,1121);DS;Gantry/Detector Slew
(0018,1130);DS;Table Height
(0018,1131);DS;Table Traverse
(0018,1134);CS;Table Motion
(0018,1135);DS;Table Vertical Increment
(0018,1136);DS;Table Lateral Increment
(0018,1137);DS;Table Longitudinal Increment
(0018,1138);DS;Table Angle
(0018,113A);CS;Table Type
(0018,1140);CS;Rotation Direction
(0018,1141);DS;Angular Position
(0018,1142);DS;Radial Position
(0018,1143);DS;Scan Arc
(0018,1144);DS;Angular Step
(0018,1145);DS;Center of Rotation Offset
(0018,1146);DS;Rotation Offset
(0018,1147);CS;Field of View Shape
(0018,1149);IS;Field of View Dimension(s)
(0018,1150);IS;Exposure Time
(0018,1151);IS;X-Ray Tube Current
(0018,1152);IS;Exposure
(0018,1153);IS;Exposure in µAs
(0018,1154);DS;Average Pulse Width
(0018,1155);CS;Radiation Setting
(0018,1156);CS;Rectification Type
(0018,115A);CS;Radiation Mode
(0018,115E);DS;Image and Fluoroscopy Area Dose Product
(0018,1160);SH;Filter Type
(0018,1161);LO;Type of Filters
(0018,1162);DS;Intensifier Size
(0018,1164);DS;Imager Pixel Spacing
(0018,1166);CS;Grid
(0018,1170);IS;Generator Power
(0018,1180);SH;Collimator/grid Name
(0018,1181);CS;Collimator Type
(0018,1182);IS;Focal Distance
(0018,1183);DS;X Focus Center
(0018,1184);DS;Y Focus Center
(0018,1190);DS;Focal Spot(s)
(0018,1191);CS;Anode Target Material
(0018,11A0);DS;Body Part Thickness
(0018,11A2);DS;Compression Force
(0018,11A4);LO;Paddle Description
(0018,1200);DA;Date of Last Calibration
(0018,1201);TM;Time of Last Calibration
(0018,1202);DT;DateTime of Last Calibration
(0018,1210);SH;Convolution Kernel
(0018,1240);IS;Upper/Lower Pixel Values
(0018,1242);IS;Actual Frame Duration
(0018,1243);IS;Count Rate
(0018,1244);US;Preferred Playback Sequencing
(0018,1250);SH;Receive Coil Name
(0018,1251);SH;Transmit Coil Name
(0018,1260);SH;Plate Type
(0018,1261);LO;Phosphor Type
(0018,1271);FD;Water Equivalent Diameter
(0018,1272);SQ;Water Equivalent Diameter Calculation Method Code Sequence
(0018,1300);DS;Scan Velocity
(0018,1301);CS;Whole Body Technique
(0018,1302);IS;Scan Length
(0018,1310);US;Acquisition Matrix
(0018,1312);CS;In-plane Phase Encoding Direction
(0018,1314);DS;Flip Angle
(0018,1315);CS;Variable Flip Angle Flag
(0018,1316);DS;SAR
(0018,1318);DS;dB/dt
(0018,1320);FL;B1rms
(0018,1400);LO;Acquisition Device Processing Description
(0018,1401);LO;Acquisition Device Processing Code
(0018,1402);CS;Cassette Orientation
(0018,1403);CS;Cassette Size
(0018,1404);US;Exposures on Plate
(0018,1405);IS;Relative X-Ray Exposure
(0018,1411);DS;Exposure Index
(0018,1412);DS;Target Exposure Index
(0018,1413);DS;Deviation Index
(0018,1450);DS;Column Angulation
(0018,1460);DS;Tomo Layer Height
(0018,1470);DS;Tomo Angle
(0018,1480);DS;Tomo Time
(0018,1490);CS;Tomo Type
(0018,1491);CS;Tomo Class
(0018,1495);IS;Number of Tomosynthesis Source Images
(0018,1500);CS;Positioner Motion
(0018,1508);CS;Positioner Type
(0018,1510);DS;Positioner Primary Angle
(0018,1511);DS;Positioner Secondary Angle
(0018,1520);DS;Positioner Primary Angle Increment
(0018,1521);DS;Positioner Secondary Angle Increment
(0018,1530);DS;Detector Primary Angle
(0018,1531);DS;Detector Secondary Angle
(0018,1600);CS;Shutter Shape
(0018,1602);IS;Shutter Left Vertical Edge
(0018,1604);IS;Shutter Right Vertical Edge
(0018,1606);IS;Shutter Upper Horizontal Edge
(0018,1608);IS;Shutter Lower Horizontal Edge
(0018,1610);IS;Center of Circular Shutter
(0018,1612);IS;Radius of Circular Shutter
(0018,1620);IS;Vertices of the Polygonal Shutter
(0018,1622);US;Shutter Presentation Value
(0018,1623);US;Shutter Overlay Group
(0018,1624);US;Shutter Presentation Color CIELab Value
(0018,1700);CS;Collimator Shape
(0018,1702);IS;Collimator Left Vertical Edge
(0018,1704);IS;Collimator Right Vertical Edge
(0018,1706);IS;Collimator Upper Horizontal Edge
(0018,1708);IS;Collimator Lower Horizontal Edge
(0018,1710);IS;Center of Circular Collimator
(0018,1712);IS;Radius of Circular Collimator
(0018,1720);IS;Vertices of the Polygonal Collimator
(0018,1800);CS;Acquisition Time Synchronized
(0018,1801);SH;Time Source
(0018,1802);CS;Time Distribution Protocol
(0018,1803);LO;NTP Source Address
(0018,2001);IS;Page Number Vector
(0018,2002);SH;Frame Label Vector
(0018,2003);DS;Frame Primary Angle Vector
(0018,2004);DS;Frame Secondary Angle Vector
(0018,2005);DS;Slice Location Vector
(0018,2006);SH;Display Window Label Vector
(0018,2010);DS;Nominal Scanned Pixel Spacing
(0018,2020);CS;Digitizing Device Transport Direction
(0018,2030);DS;Rotation of Scanned Film
(0018,2041);SQ;Biopsy Target Sequence
(0018,2042);UI;Target UID
(0018,2043);FL;Localizing Cursor Position
(0018,2044);FL;Calculated Target Position
(0018,2045);SH;Target Label
(0018,2046);FL;Displayed Z Value
(0018,3100);CS;IVUS Acquisition
(0018,3101);DS;IVUS Pullback Rate
(0018,3102);DS;IVUS Gated Rate
(0018,3103);IS;IVUS Pullback Start Frame Number
(0018,3104);IS;IVUS Pullback Stop Frame Number
(0018,3105);IS;Lesion Number
(0018,4000);LT;Acquisition Comments
(0018,5000);SH;Output Power
(0018,5010);LO;Transducer Data
(0018,5012);DS;Focus Depth
(0018,5020);LO;Processing Function
(0018,5021);LO;Postprocessing Function
(0018,5022);DS;Mechanical Index
(0018,5024);DS;Bone Thermal Index
(0018,5026);DS;Cranial Thermal Index
(0018,5027);DS;Soft Tissue Thermal Index
(0018,5028);DS;Soft Tissue-focus Thermal Index
(0018,5029);DS;Soft Tissue-surface Thermal Index
(0018,5030);DS;Dynamic Range
(0018,5040);DS;Total Gain
(0018,5050);IS;Depth of Scan Field
(0018,5100);CS;Patient Position
(0018,5101);CS;View Position
(0018,5104);SQ;Projection Eponymous Name Code Sequence
(0018,5210);DS;Image Transformation Matrix
(0018,5212);DS;Image Translation Vector
(0018,6000);DS;Sensitivity
(0018,6011);SQ;Sequence of Ultrasound Regions
(0018,6012);US;Region Spatial Format
(0018,6014);US;Region Data Type
(0018,6016);UL;Region Flags
(0018,6018);UL;Region Location Min X0
(0018,601A);UL;Region Location Min Y0
(0018,601C);UL;Region Location Max X1
(0018,601E);UL;Region Location Max Y1
(0018,6020);SL;Reference Pixel X0
(0018,6022);SL;Reference Pixel Y0
(0018,6024);US;Physical Units X Direction
(0018,6026);US;Physical Units Y Direction
(0018,6028);FD;Reference Pixel Physical Value X
(0018,602A);FD;Reference Pixel Physical Value Y
(0018,602C);FD;Physical Delta X
(0018,602E);FD;Physical Delta Y
(0018,6030);UL;Transducer Frequency
(0018,6031);CS;Transducer Type
(0018,6032);UL;Pulse Repetition Frequency
(0018,6034);FD;Doppler Correction Angle
(0018,6036);FD;Steering Angle
(0018,6038);UL;Doppler Sample Volume X Position (Retired)
(0018,6039);SL;Doppler Sample Volume X Position
(0018,603A);UL;Doppler Sample Volume Y Position (Retired)
(0018,603B);SL;Doppler Sample Volume Y Position
(0018,603C);UL;TM-Line Position X0 (Retired)
(0018,603D);SL;TM-Line Position X0
(0018,603E);UL;TM-Line Position Y0 (Retired)
(0018,603F);SL;TM-Line Position Y0
(0018,6040);UL;TM-Line Position X1 (Retired)
(0018,6041);SL;TM-Line Position X1
(0018,6042);UL;TM-Line Position Y1 (Retired)
(0018,6043);SL;TM-Line Position Y1
(0018,6044);US;Pixel Component Organization
(0018,6046);UL;Pixel Component Mask
(0018,6048);UL;Pixel Component Range Start
(0018,604A);UL;Pixel Component Range Stop
(0018,604C);US;Pixel Component Physical Units
(0018,604E);US;Pixel Component Data Type
(0018,6050);UL;Number of Table Break Points
(0018,6052);UL;Table of X Break Points
(0018,6054);FD;Table of Y Break Points
(0018,6056);UL;Number of Table Entries
(0018,6058);UL;Table of Pixel Values
(0018,605A);FL;Table of Parameter Values
(0018,6060);FL;R Wave Time Vector
(0018,7000);CS;Detector Conditions Nominal Flag
(0018,7001);DS;Detector Temperature
(0018,7004);CS;Detector Type
(0018,7005);CS;Detector Configuration
(0018,7006);LT;Detector Description
(0018,7008);LT;Detector Mode
(0018,700A);SH;Detector ID
(0018,700C);DA;Date of Last Detector Calibration
(0018,700E);TM;Time of Last Detector Calibration
(0018,7010);IS;Exposures on Detector Since Last Calibration
(0018,7011);IS;Exposures on Detector Since Manufactured
(0018,7012);DS;Detector Time Since Last Exposure
(0018,7014);DS;Detector Active Time
(0018,7016);DS;Detector Activation Offset From Exposure
(0018,701A);DS;Detector Binning
(0018,7020);DS;Detector Element Physical Size
(0018,7022);DS;Detector Element Spacing
(0018,7024);CS;Detector Active Shape
(0018,7026);DS;Detector Active Dimension(s)
(0018,7028);DS;Detector Active Origin
(0018,702A);LO;Detector Manufacturer Name
(0018,702B);LO;Detector Manufacturer's Model Name
(0018,7030);DS;Field of View Origin
(0018,7032);DS;Field of View Rotation
(0018,7034);CS;Field of View Horizontal Flip
(0018,7036);FL;Pixel Data Area Origin Relative To FOV
(0018,7038);FL;Pixel Data Area Rotation Angle Relative To FOV
(0018,7040);LT;Grid Absorbing Material
(0018,7041);LT;Grid Spacing Material
(0018,7042);DS;Grid Thickness
(0018,7044);DS;Grid Pitch
(0018,7046);IS;Grid Aspect Ratio
(0018,7048);DS;Grid Period
(0018,704C);DS;Grid Focal Distance
(0018,7050);CS;Filter Material
(0018,7052);DS;Filter Thickness Minimum
(0018,7054);DS;Filter Thickness Maximum
(0018,7056);FL;Filter Beam Path Length Minimum
(0018,7058);FL;Filter Beam Path Length Maximum
(0018,7060);CS;Exposure Control Mode
(0018,7062);LT;Exposure Control Mode Description
(0018,7064);CS;Exposure Status
(0018,7065);DS;Phototimer Setting
(0018,8150);DS;Exposure Time in µS
(0018,8151);DS;X-Ray Tube Current in µA
(0018,9004);CS;Content Qualification
(0018,9005);SH;Pulse Sequence Name
(0018,9006);SQ;MR Imaging Modifier Sequence
(0018,9008);CS;Echo Pulse Sequence
(0018,9009);CS;Inversion Recovery
(0018,9010);CS;Flow Compensation
(0018,9011);CS;Multiple Spin Echo
(0018,9012);CS;Multi-planar Excitation
(0018,9014);CS;Phase Contrast
(0018,9015);CS;Time of Flight Contrast
(0018,9016);CS;Spoiling
(0018,9017);CS;Steady State Pulse Sequence
(0018,9018);CS;Echo Planar Pulse Sequence
(0018,9019);FD;Tag Angle First Axis
(0018,9020);CS;Magnetization Transfer
(0018,9021);CS;T2 Preparation
(0018,9022);CS;Blood Signal Nulling
(0018,9024);CS;Saturation Recovery
(0018,9025);CS;Spectrally Selected Suppression
(0018,9026);CS;Spectrally Selected Excitation
(0018,9027);CS;Spatial Pre-saturation
(0018,9028);CS;Tagging
(0018,9029);CS;Oversampling Phase
(0018,9030);FD;Tag Spacing First Dimension
(0018,9032);CS;Geometry of k-Space Traversal
(0018,9033);CS;Segmented k-Space Traversal
(0018,9034);CS;Rectilinear Phase Encode Reordering
(0018,9035);FD;Tag Thickness
(0018,9036);CS;Partial Fourier Direction
(0018,9037);CS;Cardiac Synchronization Technique
(0018,9041);LO;Receive Coil Manufacturer Name
(0018,9042);SQ;MR Receive Coil Sequence
(0018,9043);CS;Receive Coil Type
(0018,9044);CS;Quadrature Receive Coil
(0018,9045);SQ;Multi-Coil Definition Sequence
(0018,9046);LO;Multi-Coil Configuration
(0018,9047);SH;Multi-Coil Element Name
(0018,9048);CS;Multi-Coil Element Used
(0018,9049);SQ;MR Transmit Coil Sequence
(0018,9050);LO;Transmit Coil Manufacturer Name
(0018,9051);CS;Transmit Coil Type
(0018,9052);FD;Spectral Width
(0018,9053);FD;Chemical Shift Reference
(0018,9054);CS;Volume Localization Technique
(0018,9058);US;MR Acquisition Frequency Encoding Steps
(0018,9059);CS;De-coupling
(0018,9060);CS;De-coupled Nucleus
(0018,9061);FD;De-coupling Frequency
(0018,9062);CS;De-coupling Method
(0018,9063);FD;De-coupling Chemical Shift Reference
(0018,9064);CS;k-space Filtering
(0018,9065);CS;Time Domain Filtering
(0018,9066);US;Number of Zero Fills
(0018,9067);CS;Baseline Correction
(0018,9069);FD;Parallel Reduction Factor In-plane
(0018,9070);FD;Cardiac R-R Interval Specified
(0018,9073);FD;Acquisition Duration
(0018,9074);DT;Frame Acquisition DateTime
(0018,9075);CS;Diffusion Directionality
(0018,9076);SQ;Diffusion Gradient Direction Sequence
(0018,9077);CS;Parallel Acquisition
(0018,9078);CS;Parallel Acquisition Technique
(0018,9079);FD;Inversion Times
(0018,9080);ST;Metabolite Map Description
(0018,9081);CS;Partial Fourier
(0018,9082);FD;Effective Echo Time
(0018,9083);SQ;Metabolite Map Code Sequence
(0018,9084);SQ;Chemical Shift Sequence
(0018,9085);CS;Cardiac Signal Source
(0018,9087);FD;Diffusion b-value
(0018,9089);FD;Diffusion Gradient Orientation
(0018,9090);FD;Velocity Encoding Direction
(0018,9091);FD;Velocity Encoding Minimum Value
(0018,9092);SQ;Velocity Encoding Acquisition Sequence
(0018,9093);US;Number of k-Space Trajectories
(0018,9094);CS;Coverage of k-Space
(0018,9095);UL;Spectroscopy Acquisition Phase Rows
(0018,9096);FD;Parallel Reduction Factor In-plane (Retired)
(0018,9098);FD;Transmitter Frequency
(0018,9100);CS;Resonant Nucleus
(0018,9101);CS;Frequency Correction
(0018,9103);SQ;MR Spectroscopy FOV/Geometry Sequence
(0018,9104);FD;Slab Thickness
(0018,9105);FD;Slab Orientation
(0018,9106);FD;Mid Slab Position
(0018,9107);SQ;MR Spatial Saturation Sequence
(0018,9112);SQ;MR Timing and Related Parameters Sequence
(0018,9114);SQ;MR Echo Sequence
(0018,9115);SQ;MR Modifier Sequence
(0018,9117);SQ;MR Diffusion Sequence
(0018,9118);SQ;Cardiac Synchronization Sequence
(0018,9119);SQ;MR Averages Sequence
(0018,9125);SQ;MR FOV/Geometry Sequence
(0018,9126);SQ;Volume Localization Sequence
(0018,9127);UL;Spectroscopy Acquisition Data Columns
(0018,9147);CS;Diffusion Anisotropy Type
(0018,9151);DT;Frame Reference DateTime
(0018,9152);SQ;MR Metabolite Map Sequence
(0018,9155);FD;Parallel Reduction Factor out-of-plane
(0018,9159);UL;Spectroscopy Acquisition Out-of-plane Phase Steps
(0018,9166);CS;Bulk Motion Status
(0018,9168);FD;Parallel Reduction Factor Second In-plane
(0018,9169);CS;Cardiac Beat Rejection Technique
(0018,9170);CS;Respiratory Motion Compensation Technique
(0018,9171);CS;Respiratory Signal Source
(0018,9172);CS;Bulk Motion Compensation Technique
(0018,9173);CS;Bulk Motion Signal Source
(0018,9174);CS;Applicable Safety Standard Agency
(0018,9175);LO;Applicable Safety Standard Description
(0018,9176);SQ;Operating Mode Sequence
(0018,9177);CS;Operating Mode Type
(0018,9178);CS;Operating Mode
(0018,9179);CS;Specific Absorption Rate Definition
(0018,9180);CS;Gradient Output Type
(0018,9181);FD;Specific Absorption Rate Value
(0018,9182);FD;Gradient Output
(0018,9183);CS;Flow Compensation Direction
(0018,9184);FD;Tagging Delay
(0018,9185);ST;Respiratory Motion Compensation Technique Description
(0018,9186);SH;Respiratory Signal Source ID
(0018,9195);FD;Chemical Shift Minimum Integration Limit in Hz
(0018,9196);FD;Chemical Shift Maximum Integration Limit in Hz
(0018,9197);SQ;MR Velocity Encoding Sequence
(0018,9198);CS;First Order Phase Correction
(0018,9199);CS;Water Referenced Phase Correction
(0018,9200);CS;MR Spectroscopy Acquisition Type
(0018,9214);CS;Respiratory Cycle Position
(0018,9217);FD;Velocity Encoding Maximum Value
(0018,9218);FD;Tag Spacing Second Dimension
(0018,9219);SS;Tag Angle Second Axis
(0018,9220);FD;Frame Acquisition Duration
(0018,9226);SQ;MR Image Frame Type Sequence
(0018,9227);SQ;MR Spectroscopy Frame Type Sequence
(0018,9231);US;MR Acquisition Phase Encoding Steps in-plane
(0018,9232);US;MR Acquisition Phase Encoding Steps out-of-plane
(0018,9234);UL;Spectroscopy Acquisition Phase Columns
(0018,9236);CS;Cardiac Cycle Position
(0018,9239);SQ;Specific Absorption Rate Sequence
(0018,9240);US;RF Echo Train Length
(0018,9241);US;Gradient Echo Train Length
(0018,9250);CS;Arterial Spin Labeling Contrast
(0018,9251);SQ;MR Arterial Spin Labeling Sequence
(0018,9252);LO;ASL Technique Description
(0018,9253);US;ASL Slab Number
(0018,9254);FD;ASL Slab Thickness
(0018,9255);FD;ASL Slab Orientation
(0018,9256);FD;ASL Mid Slab Position
(0018,9257);CS;ASL Context
(0018,9258);UL;ASL Pulse Train Duration
(0018,9259);CS;ASL Crusher Flag
(0018,925A);FD;ASL Crusher Flow Limit
(0018,925B);LO;ASL Crusher Description
(0018,925C);CS;ASL Bolus Cut-off Flag
(0018,925D);SQ;ASL Bolus Cut-off Timing Sequence
(0018,925E);LO;ASL Bolus Cut-off Technique
(0018,925F);UL;ASL Bolus Cut-off Delay Time
(0018,9260);SQ;ASL Slab Sequence
(0018,9295);FD;Chemical Shift Minimum Integration Limit in ppm
(0018,9296);FD;Chemical Shift Maximum Integration Limit in ppm
(0018,9297);CS;Water Reference Acquisition
(0018,9298);IS;Echo Peak Position
(0018,9301);SQ;CT Acquisition Type Sequence
(0018,9302);CS;Acquisition Type
(0018,9303);FD;Tube Angle
(0018,9304);SQ;CT Acquisition Details Sequence
(0018,9305);FD;Revolution Time
(0018,9306);FD;Single Collimation Width
(0018,9307);FD;Total Collimation Width
(0018,9308);SQ;CT Table Dynamics Sequence
(0018,9309);FD;Table Speed
(0018,9310);FD;Table Feed per Rotation
(0018,9311);FD;Spiral Pitch Factor
(0018,9312);SQ;CT Geometry Sequence
(0018,9313);FD;Data Collection Center (Patient)
(0018,9314);SQ;CT Reconstruction Sequence
(0018,9315);CS;Reconstruction Algorithm
(0018,9316);CS;Convolution Kernel Group
(0018,9317);FD;Reconstruction Field of View
(0018,9318);FD;Reconstruction Target Center (Patient)
(0018,9319);FD;Reconstruction Angle
(0018,9320);SH;Image Filter
(0018,9321);SQ;CT Exposure Sequence
(0018,9322);FD;Reconstruction Pixel Spacing
(0018,9323);CS;Exposure Modulation Type
(0018,9324);FD;Estimated Dose Saving
(0018,9325);SQ;CT X-Ray Details Sequence
(0018,9326);SQ;CT Position Sequence
(0018,9327);FD;Table Position
(0018,9328);FD;Exposure Time in ms
(0018,9329);SQ;CT Image Frame Type Sequence
(0018,9330);FD;X-Ray Tube Current in mA
(0018,9332);FD;Exposure in mAs
(0018,9333);CS;Constant Volume Flag
(0018,9334);CS;Fluoroscopy Flag
(0018,9335);FD;Distance Source to Data Collection Center
(0018,9337);US;Contrast/Bolus Agent Number
(0018,9338);SQ;Contrast/Bolus Ingredient Code Sequence
(0018,9340);SQ;Contrast Administration Profile Sequence
(0018,9341);SQ;Contrast/Bolus Usage Sequence
(0018,9342);CS;Contrast/Bolus Agent Administered
(0018,9343);CS;Contrast/Bolus Agent Detected
(0018,9344);CS;Contrast/Bolus Agent Phase
(0018,9345);FD;CTDIvol
(0018,9346);SQ;CTDI Phantom Type Code Sequence
(0018,9351);FL;Calcium Scoring Mass Factor Patient
(0018,9352);FL;Calcium Scoring Mass Factor Device
(0018,9353);FL;Energy Weighting Factor
(0018,9360);SQ;CT Additional X-Ray Source Sequence
(0018,9401);SQ;Projection Pixel Calibration Sequence
(0018,9402);FL;Distance Source to Isocenter
(0018,9403);FL;Distance Object to Table Top
(0018,9404);FL;Object Pixel Spacing in Center of Beam
(0018,9405);SQ;Positioner Position Sequence
(0018,9406);SQ;Table Position Sequence
(0018,9407);SQ;Collimator Shape Sequence
(0018,9410);CS;Planes in Acquisition
(0018,9412);SQ;XA/XRF Frame Characteristics Sequence
(0018,9417);SQ;Frame Acquisition Sequence
(0018,9420);CS;X-Ray Receptor Type
(0018,9423);LO;Acquisition Protocol Name
(0018,9424);LT;Acquisition Protocol Description
(0018,9425);CS;Contrast/Bolus Ingredient Opaque
(0018,9426);FL;Distance Receptor Plane to Detector Housing
(0018,9427);CS;Intensifier Active Shape
(0018,9428);FL;Intensifier Active Dimension(s)
(0018,9429);FL;Physical Detector Size
(0018,9430);FL;Position of Isocenter Projection
(0018,9432);SQ;Field of View Sequence
(0018,9433);LO;Field of View Description
(0018,9434);SQ;Exposure Control Sensing Regions Sequence
(0018,9435);CS;Exposure Control Sensing Region Shape
(0018,9436);SS;Exposure Control Sensing Region Left Vertical Edge
(0018,9437);SS;Exposure Control Sensing Region Right Vertical Edge
(0018,9438);SS;Exposure Control Sensing Region Upper Horizontal Edge
(0018,9439);SS;Exposure Control Sensing Region Lower Horizontal Edge
(0018,9440);SS;Center of Circular Exposure Control Sensing Region
(0018,9441);US;Radius of Circular Exposure Control Sensing Region
(0018,9442);SS;Vertices of the Polygonal Exposure Control Sensing Region
(0018,9445);;
(0018,9447);FL;Column Angulation (Patient)
(0018,9449);FL;Beam Angle
(0018,9451);SQ;Frame Detector Parameters Sequence
(0018,9452);FL;Calculated Anatomy Thickness
(0018,9455);SQ;Calibration Sequence
(0018,9456);SQ;Object Thickness Sequence
(0018,9457);CS;Plane Identification
(0018,9461);FL;Field of View Dimension(s) in Float
(0018,9462);SQ;Isocenter Reference System Sequence
(0018,9463);FL;Positioner Isocenter Primary Angle
(0018,9464);FL;Positioner Isocenter Secondary Angle
(0018,9465);FL;Positioner Isocenter Detector Rotation Angle
(0018,9466);FL;Table X Position to Isocenter
(0018,9467);FL;Table Y Position to Isocenter
(0018,9468);FL;Table Z Position to Isocenter
(0018,9469);FL;Table Horizontal Rotation Angle
(0018,9470);FL;Table Head Tilt Angle
(0018,9471);FL;Table Cradle Tilt Angle
(0018,9472);SQ;Frame Display Shutter Sequence
(0018,9473);FL;Acquired Image Area Dose Product
(0018,9474);CS;C-arm Positioner Tabletop Relationship
(0018,9476);SQ;X-Ray Geometry Sequence
(0018,9477);SQ;Irradiation Event Identification Sequence
(0018,9504);SQ;X-Ray 3D Frame Type Sequence
(0018,9506);SQ;Contributing Sources Sequence
(0018,9507);SQ;X-Ray 3D Acquisition Sequence
(0018,9508);FL;Primary Positioner Scan Arc
(0018,9509);FL;Secondary Positioner Scan Arc
(0018,9510);FL;Primary Positioner Scan Start Angle
(0018,9511);FL;Secondary Positioner Scan Start Angle
(0018,9514);FL;Primary Positioner Increment
(0018,9515);FL;Secondary Positioner Increment
(0018,9516);DT;Start Acquisition DateTime
(0018,9517);DT;End Acquisition DateTime
(0018,9518);SS;Primary Positioner Increment Sign
(0018,9519);SS;Secondary Positioner Increment Sign
(0018,9524);LO;Application Name
(0018,9525);LO;Application Version
(0018,9526);LO;Application Manufacturer
(0018,9527);CS;Algorithm Type
(0018,9528);LO;Algorithm Description
(0018,9530);SQ;X-Ray 3D Reconstruction Sequence
(0018,9531);LO;Reconstruction Description
(0018,9538);SQ;Per Projection Acquisition Sequence
(0018,9541);SQ;Detector Position Sequence
(0018,9542);SQ;X-Ray Acquisition Dose Sequence
(0018,9543);FD;X-Ray Source Isocenter Primary Angle
(0018,9544);FD;X-Ray Source Isocenter Secondary Angle
(0018,9545);FD;Breast Support Isocenter Primary Angle
(0018,9546);FD;Breast Support Isocenter Secondary Angle
(0018,9547);FD;Breast Support X Position to Isocenter
(0018,9548);FD;Breast Support Y Position to Isocenter
(0018,9549);FD;Breast Support Z Position to Isocenter
(0018,9550);FD;Detector Isocenter Primary Angle
(0018,9551);FD;Detector Isocenter Secondary Angle
(0018,9552);FD;Detector X Position to Isocenter
(0018,9553);FD;Detector Y Position to Isocenter
(0018,9554);FD;Detector Z Position to Isocenter
(0018,9555);SQ;X-Ray Grid Sequence
(0018,9556);SQ;X-Ray Filter Sequence
(0018,9557);FD;Detector Active Area TLHC Position
(0018,9558);FD;Detector Active Area Orientation
(0018,9559);CS;Positioner Primary Angle Direction
(0018,9601);SQ;Diffusion b-matrix Sequence
(0018,9602);FD;Diffusion b-value XX
(0018,9603);FD;Diffusion b-value XY
(0018,9604);FD;Diffusion b-value XZ
(0018,9605);FD;Diffusion b-value YY
(0018,9606);FD;Diffusion b-value YZ
(0018,9607);FD;Diffusion b-value ZZ
(0018,9621);SQ;Functional MR Sequence
(0018,9622);CS;Functional Settling Phase Frames Present
(0018,9623);DT;Functional Sync Pulse
(0018,9624);CS;Settling Phase Frame
(0018,9701);DT;Decay Correction DateTime
(0018,9715);FD;Start Density Threshold
(0018,9716);FD;Start Relative Density Difference Threshold
(0018,9717);FD;Start Cardiac Trigger Count Threshold
(0018,9718);FD;Start Respiratory Trigger Count Threshold
(0018,9719);FD;Termination Counts Threshold
(0018,9720);FD;Termination Density Threshold
(0018,9721);FD;Termination Relative Density Threshold
(0018,9722);FD;Termination Time Threshold
(0018,9723);FD;Termination Cardiac Trigger Count Threshold
(0018,9724);FD;Termination Respiratory Trigger Count Threshold
(0018,9725);CS;Detector Geometry
(0018,9726);FD;Transverse Detector Separation
(0018,9727);FD;Axial Detector Dimension
(0018,9729);US;Radiopharmaceutical Agent Number
(0018,9732);SQ;PET Frame Acquisition Sequence
(0018,9733);SQ;PET Detector Motion Details Sequence
(0018,9734);SQ;PET Table Dynamics Sequence
(0018,9735);SQ;PET Position Sequence
(0018,9736);SQ;PET Frame Correction Factors Sequence
(0018,9737);SQ;Radiopharmaceutical Usage Sequence
(0018,9738);CS;Attenuation Correction Source
(0018,9739);US;Number of Iterations
(0018,9740);US;Number of Subsets
(0018,9749);SQ;PET Reconstruction Sequence
(0018,9751);SQ;PET Frame Type Sequence
(0018,9755);CS;Time of Flight Information Used
(0018,9756);CS;Reconstruction Type
(0018,9758);CS;Decay Corrected
(0018,9759);CS;Attenuation Corrected
(0018,9760);CS;Scatter Corrected
(0018,9761);CS;Dead Time Corrected
(0018,9762);CS;Gantry Motion Corrected
(0018,9763);CS;Patient Motion Corrected
(0018,9764);CS;Count Loss Normalization Corrected
(0018,9765);CS;Randoms Corrected
(0018,9766);CS;Non-uniform Radial Sampling Corrected
(0018,9767);CS;Sensitivity Calibrated
(0018,9768);CS;Detector Normalization Correction
(0018,9769);CS;Iterative Reconstruction Method
(0018,9770);CS;Attenuation Correction Temporal Relationship
(0018,9771);SQ;Patient Physiological State Sequence
(0018,9772);SQ;Patient Physiological State Code Sequence
(0018,9801);FD;Depth(s) of Focus
(0018,9803);SQ;Excluded Intervals Sequence
(0018,9804);DT;Exclusion Start DateTime
(0018,9805);FD;Exclusion Duration
(0018,9806);SQ;US Image Description Sequence
(0018,9807);SQ;Image Data Type Sequence
(0018,9808);CS;Data Type
(0018,9809);SQ;Transducer Scan Pattern Code Sequence
(0018,980B);CS;Aliased Data Type
(0018,980C);CS;Position Measuring Device Used
(0018,980D);SQ;Transducer Geometry Code Sequence
(0018,980E);SQ;Transducer Beam Steering Code Sequence
(0018,980F);SQ;Transducer Application Code Sequence
(0018,9810);US or SS;Zero Velocity Pixel Value
(0018,A001);SQ;Contributing Equipment Sequence
(0018,A002);DT;Contribution DateTime
(0018,A003);ST;Contribution Description
(0020,000D);UI;Study Instance UID
(0020,000E);UI;Series Instance UID
(0020,0010);SH;Study ID
(0020,0011);IS;Series Number
(0020,0012);IS;Acquisition Number
(0020,0013);IS;Instance Number
(0020,0014);IS;Isotope Number
(0020,0015);IS;Phase Number
(0020,0016);IS;Interval Number
(0020,0017);IS;Time Slot Number
(0020,0018);IS;Angle Number
(0020,0019);IS;Item Number
(0020,0020);CS;Patient Orientation
(0020,0022);IS;Overlay Number
(0020,0024);IS;Curve Number
(0020,0026);IS;LUT Number
(0020,0030);DS;Image Position
(0020,0032);DS;Image Position (Patient)
(0020,0035);DS;Image Orientation
(0020,0037);DS;Image Orientation (Patient)
(0020,0050);DS;Location
(0020,0052);UI;Frame of Reference UID
(0020,0060);CS;Laterality
(0020,0062);CS;Image Laterality
(0020,0070);LO;Image Geometry Type
(0020,0080);CS;Masking Image
(0020,00AA);IS;Report Number
(0020,0100);IS;Temporal Position Identifier
(0020,0105);IS;Number of Temporal Positions
(0020,0110);DS;Temporal Resolution
(0020,0200);UI;Synchronization Frame of Reference UID
(0020,0242);UI;SOP Instance UID of Concatenation Source
(0020,1000);IS;Series in Study
(0020,1001);IS;Acquisitions in Series
(0020,1002);IS;Images in Acquisition
(0020,1003);IS;Images in Series
(0020,1004);IS;Acquisitions in Study
(0020,1005);IS;Images in Study
(0020,1020);LO;Reference
(0020,1040);LO;Position Reference Indicator
(0020,1041);DS;Slice Location
(0020,1070);IS;Other Study Numbers
(0020,1200);IS;Number of Patient Related Studies
(0020,1202);IS;Number of Patient Related Series
(0020,1204);IS;Number of Patient Related Instances
(0020,1206);IS;Number of Study Related Series
(0020,1208);IS;Number of Study Related Instances
(0020,1209);IS;Number of Series Related Instances
(0020,31xx);CS;Source Image IDs
(0020,3401);CS;Modifying Device ID
(0020,3402);CS;Modified Image ID
(0020,3403);DA;Modified Image Date
(0020,3404);LO;Modifying Device Manufacturer
(0020,3405);TM;Modified Image Time
(0020,3406);LO;Modified Image Description
(0020,4000);LT;Image Comments
(0020,5000);AT;Original Image Identification
(0020,5002);LO;Original Image Identification Nomenclature
(0020,9056);SH;Stack ID
(0020,9057);UL;In-Stack Position Number
(0020,9071);SQ;Frame Anatomy Sequence
(0020,9072);CS;Frame Laterality
(0020,9111);SQ;Frame Content Sequence
(0020,9113);SQ;Plane Position Sequence
(0020,9116);SQ;Plane Orientation Sequence
(0020,9128);UL;Temporal Position Index
(0020,9153);FD;Nominal Cardiac Trigger Delay Time
(0020,9154);FL;Nominal Cardiac Trigger Time Prior To R-Peak
(0020,9155);FL;Actual Cardiac Trigger Time Prior To R-Peak
(0020,9156);US;Frame Acquisition Number
(0020,9157);UL;Dimension Index Values
(0020,9158);LT;Frame Comments
(0020,9161);UI;Concatenation UID
(0020,9162);US;In-concatenation Number
(0020,9163);US;In-concatenation Total Number
(0020,9164);UI;Dimension Organization UID
(0020,9165);AT;Dimension Index Pointer
(0020,9167);AT;Functional Group Pointer
(0020,9170);SQ;Unassigned Shared Converted Attributes Sequence
(0020,9171);SQ;Unassigned Per-Frame Converted Attributes Sequence
(0020,9172);SQ;Conversion Source Attributes Sequence
(0020,9213);LO;Dimension Index Private Creator
(0020,9221);SQ;Dimension Organization Sequence
(0020,9222);SQ;Dimension Index Sequence
(0020,9228);UL;Concatenation Frame Offset Number
(0020,9238);LO;Functional Group Private Creator
(0020,9241);FL;Nominal Percentage of Cardiac Phase
(0020,9245);FL;Nominal Percentage of Respiratory Phase
(0020,9246);FL;Starting Respiratory Amplitude
(0020,9247);CS;Starting Respiratory Phase
(0020,9248);FL;Ending Respiratory Amplitude
(0020,9249);CS;Ending Respiratory Phase
(0020,9250);CS;Respiratory Trigger Type
(0020,9251);FD;R-R Interval Time Nominal
(0020,9252);FD;Actual Cardiac Trigger Delay Time
(0020,9253);SQ;Respiratory Synchronization Sequence
(0020,9254);FD;Respiratory Interval Time
(0020,9255);FD;Nominal Respiratory Trigger Delay Time
(0020,9256);FD;Respiratory Trigger Delay Threshold
(0020,9257);FD;Actual Respiratory Trigger Delay Time
(0020,9301);FD;Image Position (Volume)
(0020,9302);FD;Image Orientation (Volume)
(0020,9307);CS;Ultrasound Acquisition Geometry
(0020,9308);FD;Apex Position
(0020,9309);FD;Volume to Transducer Mapping Matrix
(0020,930A);FD;Volume to Table Mapping Matrix
(0020,930B);CS;Volume to Transducer Relationship
(0020,930C);CS;Patient Frame of Reference Source
(0020,930D);FD;Temporal Position Time Offset
(0020,930E);SQ;Plane Position (Volume) Sequence
(0020,930F);SQ;Plane Orientation (Volume) Sequence
(0020,9310);SQ;Temporal Position Sequence
(0020,9311);CS;Dimension Organization Type
(0020,9312);UI;Volume Frame of Reference UID
(0020,9313);UI;Table Frame of Reference UID
(0020,9421);LO;Dimension Description Label
(0020,9450);SQ;Patient Orientation in Frame Sequence
(0020,9453);LO;Frame Label
(0020,9518);US;Acquisition Index
(0020,9529);SQ;Contributing SOP Instances Reference Sequence
(0020,9536);US;Reconstruction Index
(0022,0001);US;Light Path Filter Pass-Through Wavelength
(0022,0002);US;Light Path Filter Pass Band
(0022,0003);US;Image Path Filter Pass-Through Wavelength
(0022,0004);US;Image Path Filter Pass Band
(0022,0005);CS;Patient Eye Movement Commanded
(0022,0006);SQ;Patient Eye Movement Command Code Sequence
(0022,0007);FL;Spherical Lens Power
(0022,0008);FL;Cylinder Lens Power
(0022,0009);FL;Cylinder Axis
(0022,000A);FL;Emmetropic Magnification
(0022,000B);FL;Intra Ocular Pressure
(0022,000C);FL;Horizontal Field of View
(0022,000D);CS;Pupil Dilated
(0022,000E);FL;Degree of Dilation
(0022,0010);FL;Stereo Baseline Angle
(0022,0011);FL;Stereo Baseline Displacement
(0022,0012);FL;Stereo Horizontal Pixel Offset
(0022,0013);FL;Stereo Vertical Pixel Offset
(0022,0014);FL;Stereo Rotation
(0022,0015);SQ;Acquisition Device Type Code Sequence
(0022,0016);SQ;Illumination Type Code Sequence
(0022,0017);SQ;Light Path Filter Type Stack Code Sequence
(0022,0018);SQ;Image Path Filter Type Stack Code Sequence
(0022,0019);SQ;Lenses Code Sequence
(0022,001A);SQ;Channel Description Code Sequence
(0022,001B);SQ;Refractive State Sequence
(0022,001C);SQ;Mydriatic Agent Code Sequence
(0022,001D);SQ;Relative Image Position Code Sequence
(0022,001E);FL;Camera Angle of View
(0022,0020);SQ;Stereo Pairs Sequence
(0022,0021);SQ;Left Image Sequence
(0022,0022);SQ;Right Image Sequence
(0022,0028);CS;Stereo Pairs Present
(0022,0030);FL;Axial Length of the Eye
(0022,0031);SQ;Ophthalmic Frame Location Sequence
(0022,0032);FL;Reference Coordinates
(0022,0035);FL;Depth Spatial Resolution
(0022,0036);FL;Maximum Depth Distortion
(0022,0037);FL;Along-scan Spatial Resolution
(0022,0038);FL;Maximum Along-scan Distortion
(0022,0039);CS;Ophthalmic Image Orientation
(0022,0041);FL;Depth of Transverse Image
(0022,0042);SQ;Mydriatic Agent Concentration Units Sequence
(0022,0048);FL;Across-scan Spatial Resolution
(0022,0049);FL;Maximum Across-scan Distortion
(0022,004E);DS;Mydriatic Agent Concentration
(0022,0055);FL;Illumination Wave Length
(0022,0056);FL;Illumination Power
(0022,0057);FL;Illumination Bandwidth
(0022,0058);SQ;Mydriatic Agent Sequence
(0022,1007);SQ;Ophthalmic Axial Measurements Right Eye Sequence
(0022,1008);SQ;Ophthalmic Axial Measurements Left Eye Sequence
(0022,1009);CS;Ophthalmic Axial Measurements Device Type
(0022,1010);CS;Ophthalmic Axial Length Measurements Type
(0022,1012);SQ;Ophthalmic Axial Length Sequence
(0022,1019);FL;Ophthalmic Axial Length
(0022,1024);SQ;Lens Status Code Sequence
(0022,1025);SQ;Vitreous Status Code Sequence
(0022,1028);SQ;IOL Formula Code Sequence
(0022,1029);LO;IOL Formula Detail
(0022,1033);FL;Keratometer Index
(0022,1035);SQ;Source of Ophthalmic Axial Length Code Sequence
(0022,1037);FL;Target Refraction
(0022,1039);CS;Refractive Procedure Occurred
(0022,1040);SQ;Refractive Surgery Type Code Sequence
(0022,1044);SQ;Ophthalmic Ultrasound Method Code Sequence
(0022,1050);SQ;Ophthalmic Axial Length Measurements Sequence
(0022,1053);FL;IOL Power
(0022,1054);FL;Predicted Refractive Error
(0022,1059);FL;Ophthalmic Axial Length Velocity
(0022,1065);LO;Lens Status Description
(0022,1066);LO;Vitreous Status Description
(0022,1090);SQ;IOL Power Sequence
(0022,1092);SQ;Lens Constant Sequence
(0022,1093);LO;IOL Manufacturer
(0022,1094);LO;Lens Constant Description
(0022,1095);LO;Implant Name
(0022,1096);SQ;Keratometry Measurement Type Code Sequence
(0022,1097);LO;Implant Part Number
(0022,1100);SQ;Referenced Ophthalmic Axial Measurements Sequence
(0022,1101);SQ;Ophthalmic Axial Length Measurements Segment Name Code Sequence
(0022,1103);SQ;Refractive Error Before Refractive Surgery Code Sequence
(0022,1121);FL;IOL Power For Exact Emmetropia
(0022,1122);FL;IOL Power For Exact Target Refraction
(0022,1125);SQ;Anterior Chamber Depth Definition Code Sequence
(0022,1127);SQ;Lens Thickness Sequence
(0022,1128);SQ;Anterior Chamber Depth Sequence
(0022,1130);FL;Lens Thickness
(0022,1131);FL;Anterior Chamber Depth
(0022,1132);SQ;Source of Lens Thickness Data Code Sequence
(0022,1133);SQ;Source of Anterior Chamber Depth Data Code Sequence
(0022,1134);SQ;Source of Refractive Measurements Sequence
(0022,1135);SQ;Source of Refractive Measurements Code Sequence
(0022,1140);CS;Ophthalmic Axial Length Measurement Modified
(0022,1150);SQ;Ophthalmic Axial Length Data Source Code Sequence
(0022,1153);SQ;Ophthalmic Axial Length Acquisition Method Code Sequence
(0022,1155);FL;Signal to Noise Ratio
(0022,1159);LO;Ophthalmic Axial Length Data Source Description
(0022,1210);SQ;Ophthalmic Axial Length Measurements Total Length Sequence
(0022,1211);SQ;Ophthalmic Axial Length Measurements Segmental Length Sequence
(0022,1212);SQ;Ophthalmic Axial Length Measurements Length Summation Sequence
(0022,1220);SQ;Ultrasound Ophthalmic Axial Length Measurements Sequence
(0022,1225);SQ;Optical Ophthalmic Axial Length Measurements Sequence
(0022,1230);SQ;Ultrasound Selected Ophthalmic Axial Length Sequence
(0022,1250);SQ;Ophthalmic Axial Length Selection Method Code Sequence
(0022,1255);SQ;Optical Selected Ophthalmic Axial Length Sequence
(0022,1257);SQ;Selected Segmental Ophthalmic Axial Length Sequence
(0022,1260);SQ;Selected Total Ophthalmic Axial Length Sequence
(0022,1262);SQ;Ophthalmic Axial Length Quality Metric Sequence
(0022,1265);SQ;Ophthalmic Axial Length Quality Metric Type Code Sequence
(0022,1273);LO;Ophthalmic Axial Length Quality Metric Type Description
(0022,1300);SQ;Intraocular Lens Calculations Right Eye Sequence
(0022,1310);SQ;Intraocular Lens Calculations Left Eye Sequence
(0022,1330);SQ;Referenced Ophthalmic Axial Length Measurement QC Image Sequence
(0022,1415);CS;Ophthalmic Mapping Device Type
(0022,1420);SQ;Acquisition Method Code Sequence
(0022,1423);SQ;Acquisition Method Algorithm Sequence
(0022,1436);SQ;Ophthalmic Thickness Map Type Code Sequence
(0022,1443);SQ;Ophthalmic Thickness Mapping Normals Sequence
(0022,1445);SQ;Retinal Thickness Definition Code Sequence
(0022,1450);SQ;Pixel Value Mapping to Coded Concept Sequence
(0022,1452);US or SS;Mapped Pixel Value
(0022,1454);LO;Pixel Value Mapping Explanation
(0022,1458);SQ;Ophthalmic Thickness Map Quality Threshold Sequence
(0022,1460);FL;Ophthalmic Thickness Map Threshold Quality Rating
(0022,1463);FL;Anatomic Structure Reference Point
(0022,1465);SQ;Registration to Localizer Sequence
(0022,1466);CS;Registered Localizer Units
(0022,1467);FL;Registered Localizer Top Left Hand Corner
(0022,1468);FL;Registered Localizer Bottom Right Hand Corner
(0022,1470);SQ;Ophthalmic Thickness Map Quality Rating Sequence
(0022,1472);SQ;Relevant OPT Attributes Sequence
(0022,1512);SQ;Transformation Method Code Sequence
(0022,1513);SQ;Transformation Algorithm Sequence
(0022,1515);CS;Ophthalmic Axial Length Method
(0022,1517);FL;Ophthalmic FOV
(0022,1518);SQ;Two Dimensional to Three Dimensional Map Sequence
(0022,1525);SQ;Wide Field Ophthalmic Photography Quality Rating Sequence
(0022,1526);SQ;Wide Field Ophthalmic Photography Quality Threshold Sequence
(0022,1527);FL;Wide Field Ophthalmic Photography Threshold Quality Rating
(0022,1528);FL;X Coordinates Center Pixel View Angle
(0022,1529);FL;Y Coordinates Center Pixel View Angle
(0022,1530);UL;Number of Map Points
(0022,1531);OF;Two Dimensional to Three Dimensional Map Data
(0024,0010);FL;Visual Field Horizontal Extent
(0024,0011);FL;Visual Field Vertical Extent
(0024,0012);CS;Visual Field Shape
(0024,0016);SQ;Screening Test Mode Code Sequence
(0024,0018);FL;Maximum Stimulus Luminance
(0024,0020);FL;Background Luminance
(0024,0021);SQ;Stimulus Color Code Sequence
(0024,0024);SQ;Background Illumination Color Code Sequence
(0024,0025);FL;Stimulus Area
(0024,0028);FL;Stimulus Presentation Time
(0024,0032);SQ;Fixation Sequence
(0024,0033);SQ;Fixation Monitoring Code Sequence
(0024,0034);SQ;Visual Field Catch Trial Sequence
(0024,0035);US;Fixation Checked Quantity
(0024,0036);US;Patient Not Properly Fixated Quantity
(0024,0037);CS;Presented Visual Stimuli Data Flag
(0024,0038);US;Number of Visual Stimuli
(0024,0039);CS;Excessive Fixation Losses Data Flag
(0024,0040);CS;Excessive Fixation Losses
(0024,0042);US;Stimuli Retesting Quantity
(0024,0044);LT;Comments on Patient's Performance of Visual Field
(0024,0045);CS;False Negatives Estimate Flag
(0024,0046);FL;False Negatives Estimate
(0024,0048);US;Negative Catch Trials Quantity
(0024,0050);US;False Negatives Quantity
(0024,0051);CS;Excessive False Negatives Data Flag
(0024,0052);CS;Excessive False Negatives
(0024,0053);CS;False Positives Estimate Flag
(0024,0054);FL;False Positives Estimate
(0024,0055);CS;Catch Trials Data Flag
(0024,0056);US;Positive Catch Trials Quantity
(0024,0057);CS;Test Point Normals Data Flag
(0024,0058);SQ;Test Point Normals Sequence
(0024,0059);CS;Global Deviation Probability Normals Flag
(0024,0060);US;False Positives Quantity
(0024,0061);CS;Excessive False Positives Data Flag
(0024,0062);CS;Excessive False Positives
(0024,0063);CS;Visual Field Test Normals Flag
(0024,0064);SQ;Results Normals Sequence
(0024,0065);SQ;Age Corrected Sensitivity Deviation Algorithm Sequence
(0024,0066);FL;Global Deviation From Normal
(0024,0067);SQ;Generalized Defect Sensitivity Deviation Algorithm Sequence
(0024,0068);FL;Localized Deviation From Normal
(0024,0069);LO;Patient Reliability Indicator
(0024,0070);FL;Visual Field Mean Sensitivity
(0024,0071);FL;Global Deviation Probability
(0024,0072);CS;Local Deviation Probability Normals Flag
(0024,0073);FL;Localized Deviation Probability
(0024,0074);CS;Short Term Fluctuation Calculated
(0024,0075);FL;Short Term Fluctuation
(0024,0076);CS;Short Term Fluctuation Probability Calculated
(0024,0077);FL;Short Term Fluctuation Probability
(0024,0078);CS;Corrected Localized Deviation From Normal Calculated
(0024,0079);FL;Corrected Localized Deviation From Normal
(0024,0080);CS;Corrected Localized Deviation From Normal Probability Calculated
(0024,0081);FL;Corrected Localized Deviation From Normal Probability
(0024,0083);SQ;Global Deviation Probability Sequence
(0024,0085);SQ;Localized Deviation Probability Sequence
(0024,0086);CS;Foveal Sensitivity Measured
(0024,0087);FL;Foveal Sensitivity
(0024,0088);FL;Visual Field Test Duration
(0024,0089);SQ;Visual Field Test Point Sequence
(0024,0090);FL;Visual Field Test Point X-Coordinate
(0024,0091);FL;Visual Field Test Point Y-Coordinate
(0024,0092);FL;Age Corrected Sensitivity Deviation Value
(0024,0093);CS;Stimulus Results
(0024,0094);FL;Sensitivity Value
(0024,0095);CS;Retest Stimulus Seen
(0024,0096);FL;Retest Sensitivity Value
(0024,0097);SQ;Visual Field Test Point Normals Sequence
(0024,0098);FL;Quantified Defect
(0024,0100);FL;Age Corrected Sensitivity Deviation Probability Value
(0024,0102);CS;Generalized Defect Corrected Sensitivity Deviation Flag
(0024,0103);FL;Generalized Defect Corrected Sensitivity Deviation Value
(0024,0104);FL;Generalized Defect Corrected Sensitivity Deviation Probability Value
(0024,0105);FL;Minimum Sensitivity Value
(0024,0106);CS;Blind Spot Localized
(0024,0107);FL;Blind Spot X-Coordinate
(0024,0108);FL;Blind Spot Y-Coordinate
(0024,0110);SQ;Visual Acuity Measurement Sequence
(0024,0112);SQ;Refractive Parameters Used on Patient Sequence
(0024,0113);CS;Measurement Laterality
(0024,0114);SQ;Ophthalmic Patient Clinical Information Left Eye Sequence
(0024,0115);SQ;Ophthalmic Patient Clinical Information Right Eye Sequence
(0024,0117);CS;Foveal Point Normative Data Flag
(0024,0118);FL;Foveal Point Probability Value
(0024,0120);CS;Screening Baseline Measured
(0024,0122);SQ;Screening Baseline Measured Sequence
(0024,0124);CS;Screening Baseline Type
(0024,0126);FL;Screening Baseline Value
(0024,0202);LO;Algorithm Source
(0024,0306);LO;Data Set Name
(0024,0307);LO;Data Set Version
(0024,0308);LO;Data Set Source
(0024,0309);LO;Data Set Description
(0024,0317);SQ;Visual Field Test Reliability Global Index Sequence
(0024,0320);SQ;Visual Field Global Results Index Sequence
(0024,0325);SQ;Data Observation Sequence
(0024,0338);CS;Index Normals Flag
(0024,0341);FL;Index Probability
(0024,0344);SQ;Index Probability Sequence
(0028,0002);US;Samples per Pixel
(0028,0003);US;Samples per Pixel Used
(0028,0004);CS;Photometric Interpretation
(0028,0005);US;Image Dimensions
(0028,0006);US;Planar Configuration
(0028,0008);IS;Number of Frames
(0028,0009);AT;Frame Increment Pointer
(0028,000A);AT;Frame Dimension Pointer
(0028,0010);US;Rows
(0028,0011);US;Columns
(0028,0012);US;Planes
(0028,0014);US;Ultrasound Color Data Present
(0028,0030);DS;Pixel Spacing
(0028,0031);DS;Zoom Factor
(0028,0032);DS;Zoom Center
(0028,0034);IS;Pixel Aspect Ratio
(0028,0040);CS;Image Format
(0028,0050);LO;Manipulated Image
(0028,0051);CS;Corrected Image
(0028,005F);LO;Compression Recognition Code
(0028,0060);CS;Compression Code
(0028,0061);SH;Compression Originator
(0028,0062);LO;Compression Label
(0028,0063);SH;Compression Description
(0028,0065);CS;Compression Sequence
(0028,0066);AT;Compression Step Pointers
(0028,0068);US;Repeat Interval
(0028,0069);US;Bits Grouped
(0028,0070);US;Perimeter Table
(0028,0071);US or SS;Perimeter Value
(0028,0080);US;Predictor Rows
(0028,0081);US;Predictor Columns
(0028,0082);US;Predictor Constants
(0028,0090);CS;Blocked Pixels
(0028,0091);US;Block Rows
(0028,0092);US;Block Columns
(0028,0093);US;Row Overlap
(0028,0094);US;Column Overlap
(0028,0100);US;Bits Allocated
(0028,0101);US;Bits Stored
(0028,0102);US;High Bit
(0028,0103);US;Pixel Representation
(0028,0104);US or SS;Smallest Valid Pixel Value
(0028,0105);US or SS;Largest Valid Pixel Value
(0028,0106);US or SS;Smallest Image Pixel Value
(0028,0107);US or SS;Largest Image Pixel Value
(0028,0108);US or SS;Smallest Pixel Value in Series
(0028,0109);US or SS;Largest Pixel Value in Series
(0028,0110);US or SS;Smallest Image Pixel Value in Plane
(0028,0111);US or SS;Largest Image Pixel Value in Plane
(0028,0120);US or SS;Pixel Padding Value
(0028,0121);US or SS;Pixel Padding Range Limit
(0028,0122);FL;Float Pixel Padding Value
(0028,0123);FD;Double Float Pixel Padding Value
(0028,0124);FL;Float Pixel Padding Range Limit
(0028,0125);FD;Double Float Pixel Padding Range Limit
(0028,0200);US;Image Location
(0028,0300);CS;Quality Control Image
(0028,0301);CS;Burned In Annotation
(0028,0302);CS;Recognizable Visual Features
(0028,0303);CS;Longitudinal Temporal Information Modified
(0028,0304);UI;Referenced Color Palette Instance UID
(0028,0400);LO;Transform Label
(0028,0401);LO;Transform Version Number
(0028,0402);US;Number of Transform Steps
(0028,0403);LO;Sequence of Compressed Data
(0028,0404);AT;Details of Coefficients
(0028,04x0);US;Rows For Nth Order Coefficients
(0028,04x1);US;Columns For Nth Order Coefficients
(0028,04x2);LO;Coefficient Coding
(0028,04x3);AT;Coefficient Coding Pointers
(0028,0700);LO;DCT Label
(0028,0701);CS;Data Block Description
(0028,0702);AT;Data Block
(0028,0710);US;Normalization Factor Format
(0028,0720);US;Zonal Map Number Format
(0028,0721);AT;Zonal Map Location
(0028,0722);US;Zonal Map Format
(0028,0730);US;Adaptive Map Format
(0028,0740);US;Code Number Format
(0028,08x0);CS;Code Label
(0028,08x2);US;Number of Tables
(0028,08x3);AT;Code Table Location
(0028,08x4);US;Bits For Code Word
(0028,08x8);AT;Image Data Location
(0028,0A02);CS;Pixel Spacing Calibration Type
(0028,0A04);LO;Pixel Spacing Calibration Description
(0028,1040);CS;Pixel Intensity Relationship
(0028,1041);SS;Pixel Intensity Relationship Sign
(0028,1050);DS;Window Center
(0028,1051);DS;Window Width
(0028,1052);DS;Rescale Intercept
(0028,1053);DS;Rescale Slope
(0028,1054);LO;Rescale Type
(0028,1055);LO;Window Center & Width Explanation
(0028,1056);CS;VOI LUT Function
(0028,1080);CS;Gray Scale
(0028,1090);CS;Recommended Viewing Mode
(0028,1100);US or SS;Gray Lookup Table Descriptor
(0028,1101);US or SS;Red Palette Color Lookup Table Descriptor
(0028,1102);US or SS;Green Palette Color Lookup Table Descriptor
(0028,1103);US or SS;Blue Palette Color Lookup Table Descriptor
(0028,1104);US;Alpha Palette Color Lookup Table Descriptor
(0028,1111);US or SS;Large Red Palette Color Lookup Table Descriptor
(0028,1112);US or SS;Large Green Palette Color Lookup Table Descriptor
(0028,1113);US or SS;Large Blue Palette Color Lookup Table Descriptor
(0028,1199);UI;Palette Color Lookup Table UID
(0028,1200);US or SS or OW;Gray Lookup Table Data
(0028,1201);OW;Red Palette Color Lookup Table Data
(0028,1202);OW;Green Palette Color Lookup Table Data
(0028,1203);OW;Blue Palette Color Lookup Table Data
(0028,1204);OW;Alpha Palette Color Lookup Table Data
(0028,1211);OW;Large Red Palette Color Lookup Table Data
(0028,1212);OW;Large Green Palette Color Lookup Table Data
(0028,1213);OW;Large Blue Palette Color Lookup Table Data
(0028,1214);UI;Large Palette Color Lookup Table UID
(0028,1221);OW;Segmented Red Palette Color Lookup Table Data
(0028,1222);OW;Segmented Green Palette Color Lookup Table Data
(0028,1223);OW;Segmented Blue Palette Color Lookup Table Data
(0028,1224);OW;Segmented Alpha Palette Color Lookup Table Data
(0028,1300);CS;Breast Implant Present
(0028,1350);CS;Partial View
(0028,1351);ST;Partial View Description
(0028,1352);SQ;Partial View Code Sequence
(0028,135A);CS;Spatial Locations Preserved
(0028,1401);SQ;Data Frame Assignment Sequence
(0028,1402);CS;Data Path Assignment
(0028,1403);US;Bits Mapped to Color Lookup Table
(0028,1404);SQ;Blending LUT 1 Sequence
(0028,1405);CS;Blending LUT 1 Transfer Function
(0028,1406);FD;Blending Weight Constant
(0028,1407);US;Blending Lookup Table Descriptor
(0028,1408);OW;Blending Lookup Table Data
(0028,140B);SQ;Enhanced Palette Color Lookup Table Sequence
(0028,140C);SQ;Blending LUT 2 Sequence
(0028,140D);CS;Blending LUT 2 Transfer Function
(0028,140E);CS;Data Path ID
(0028,140F);CS;RGB LUT Transfer Function
(0028,1410);CS;Alpha LUT Transfer Function
(0028,2000);OB;ICC Profile
(0028,2002);CS;Color Space
(0028,2110);CS;Lossy Image Compression
(0028,2112);DS;Lossy Image Compression Ratio
(0028,2114);CS;Lossy Image Compression Method
(0028,3000);SQ;Modality LUT Sequence
(0028,3002);US or SS;LUT Descriptor
(0028,3003);LO;LUT Explanation
(0028,3004);LO;Modality LUT Type
(0028,3006);US or OW;LUT Data
(0028,3010);SQ;VOI LUT Sequence
(0028,3110);SQ;Softcopy VOI LUT Sequence
(0028,4000);LT;Image Presentation Comments
(0028,5000);SQ;Bi-Plane Acquisition Sequence
(0028,6010);US;Representative Frame Number
(0028,6020);US;Frame Numbers of Interest (FOI)
(0028,6022);LO;Frame of Interest Description
(0028,6023);CS;Frame of Interest Type
(0028,6030);US;Mask Pointer(s)
(0028,6040);US;R Wave Pointer
(0028,6100);SQ;Mask Subtraction Sequence
(0028,6101);CS;Mask Operation
(0028,6102);US;Applicable Frame Range
(0028,6110);US;Mask Frame Numbers
(0028,6112);US;Contrast Frame Averaging
(0028,6114);FL;Mask Sub-pixel Shift
(0028,6120);SS;TID Offset
(0028,6190);ST;Mask Operation Explanation
(0028,7000);SQ;Equipment Administrator Sequence
(0028,7001);US;Number of Display Subsystems
(0028,7002);US;Current Configuration ID
(0028,7003);US;Display Subsystem ID
(0028,7004);SH;Display Subsystem Name
(0028,7005);LO;Display Subsystem Description
(0028,7006);CS;System Status
(0028,7007);LO;System Status Comment
(0028,7008);SQ;Target Luminance Characteristics Sequence
(0028,7009);US;Luminance Characteristics ID
(0028,700A);SQ;Display Subsystem Configuration Sequence
(0028,700B);US;Configuration ID
(0028,700C);SH;Configuration Name
(0028,700D);LO;Configuration Description
(0028,700E);US;Referenced Target Luminance Characteristics ID
(0028,700F);SQ;QA Results Sequence
(0028,7010);SQ;Display Subsystem QA Results Sequence
(0028,7011);SQ;Configuration QA Results Sequence
(0028,7012);SQ;Measurement Equipment Sequence
(0028,7013);CS;Measurement Functions
(0028,7014);CS;Measurement Equipment Type
(0028,7015);SQ;Visual Evaluation Result Sequence
(0028,7016);SQ;Display Calibration Result Sequence
(0028,7017);US;DDL Value
(0028,7018);FL;CIExy White Point
(0028,7019);CS;Display Function Type
(0028,701A);FL;Gamma Value
(0028,701B);US;Number of Luminance Points
(0028,701C);SQ;Luminance Response Sequence
(0028,701D);FL;Target Minimum Luminance
(0028,701E);FL;Target Maximum Luminance
(0028,701F);FL;Luminance Value
(0028,7020);LO;Luminance Response Description
(0028,7021);CS;White Point Flag
(0028,7022);SQ;Display Device Type Code Sequence
(0028,7023);SQ;Display Subsystem Sequence
(0028,7024);SQ;Luminance Result Sequence
(0028,7025);CS;Ambient Light Value Source
(0028,7026);CS;Measured Characteristics
(0028,7027);SQ;Luminance Uniformity Result Sequence
(0028,7028);SQ;Visual Evaluation Test Sequence
(0028,7029);CS;Test Result
(0028,702A);LO;Test Result Comment
(0028,702B);CS;Test Image Validation
(0028,702C);SQ;Test Pattern Code Sequence
(0028,702D);SQ;Measurement Pattern Code Sequence
(0028,702E);SQ;Visual Evaluation Method Code Sequence
(0028,7FE0);UR;Pixel Data Provider URL
(0028,9001);UL;Data Point Rows
(0028,9002);UL;Data Point Columns
(0028,9003);CS;Signal Domain Columns
(0028,9099);US;Largest Monochrome Pixel Value
(0028,9108);CS;Data Representation
(0028,9110);SQ;Pixel Measures Sequence
(0028,9132);SQ;Frame VOI LUT Sequence
(0028,9145);SQ;Pixel Value Transformation Sequence
(0028,9235);CS;Signal Domain Rows
(0028,9411);FL;Display Filter Percentage
(0028,9415);SQ;Frame Pixel Shift Sequence
(0028,9416);US;Subtraction Item ID
(0028,9422);SQ;Pixel Intensity Relationship LUT Sequence
(0028,9443);SQ;Frame Pixel Data Properties Sequence
(0028,9444);CS;Geometrical Properties
(0028,9445);FL;Geometric Maximum Distortion
(0028,9446);CS;Image Processing Applied
(0028,9454);CS;Mask Selection Mode
(0028,9474);CS;LUT Function
(0028,9478);FL;Mask Visibility Percentage
(0028,9501);SQ;Pixel Shift Sequence
(0028,9502);SQ;Region Pixel Shift Sequence
(0028,9503);SS;Vertices of the Region
(0028,9505);SQ;Multi-frame Presentation Sequence
(0028,9506);US;Pixel Shift Frame Range
(0028,9507);US;LUT Frame Range
(0028,9520);DS;Image to Equipment Mapping Matrix
(0028,9537);CS;Equipment Coordinate System Identification
(0032,000A);CS;Study Status ID
(0032,000C);CS;Study Priority ID
(0032,0012);LO;Study ID Issuer
(0032,0032);DA;Study Verified Date
(0032,0033);TM;Study Verified Time
(0032,0034);DA;Study Read Date
(0032,0035);TM;Study Read Time
(0032,1000);DA;Scheduled Study Start Date
(0032,1001);TM;Scheduled Study Start Time
(0032,1010);DA;Scheduled Study Stop Date
(0032,1011);TM;Scheduled Study Stop Time
(0032,1020);LO;Scheduled Study Location
(0032,1021);AE;Scheduled Study Location AE Title
(0032,1030);LO;Reason for Study
(0032,1031);SQ;Requesting Physician Identification Sequence
(0032,1032);PN;Requesting Physician
(0032,1033);LO;Requesting Service
(0032,1034);SQ;Requesting Service Code Sequence
(0032,1040);DA;Study Arrival Date
(0032,1041);TM;Study Arrival Time
(0032,1050);DA;Study Completion Date
(0032,1051);TM;Study Completion Time
(0032,1055);CS;Study Component Status ID
(0032,1060);LO;Requested Procedure Description
(0032,1064);SQ;Requested Procedure Code Sequence
(0032,1070);LO;Requested Contrast Agent
(0032,4000);LT;Study Comments
(0038,0004);SQ;Referenced Patient Alias Sequence
(0038,0008);CS;Visit Status ID
(0038,0010);LO;Admission ID
(0038,0011);LO;Issuer of Admission ID
(0038,0014);SQ;Issuer of Admission ID Sequence
(0038,0016);LO;Route of Admissions
(0038,001A);DA;Scheduled Admission Date
(0038,001B);TM;Scheduled Admission Time
(0038,001C);DA;Scheduled Discharge Date
(0038,001D);TM;Scheduled Discharge Time
(0038,001E);LO;Scheduled Patient Institution Residence
(0038,0020);DA;Admitting Date
(0038,0021);TM;Admitting Time
(0038,0030);DA;Discharge Date
(0038,0032);TM;Discharge Time
(0038,0040);LO;Discharge Diagnosis Description
(0038,0044);SQ;Discharge Diagnosis Code Sequence
(0038,0050);LO;Special Needs
(0038,0060);LO;Service Episode ID
(0038,0061);LO;Issuer of Service Episode ID
(0038,0062);LO;Service Episode Description
(0038,0064);SQ;Issuer of Service Episode ID Sequence
(0038,0100);SQ;Pertinent Documents Sequence
(0038,0101);SQ;Pertinent Resources Sequence
(0038,0102);LO;Resource Description
(0038,0300);LO;Current Patient Location
(0038,0400);LO;Patient's Institution Residence
(0038,0500);LO;Patient State
(0038,0502);SQ;Patient Clinical Trial Participation Sequence
(0038,4000);LT;Visit Comments
(003A,0004);CS;Waveform Originality
(003A,0005);US;Number of Waveform Channels
(003A,0010);UL;Number of Waveform Samples
(003A,001A);DS;Sampling Frequency
(003A,0020);SH;Multiplex Group Label
(003A,0200);SQ;Channel Definition Sequence
(003A,0202);IS;Waveform Channel Number
(003A,0203);SH;Channel Label
(003A,0205);CS;Channel Status
(003A,0208);SQ;Channel Source Sequence
(003A,0209);SQ;Channel Source Modifiers Sequence
(003A,020A);SQ;Source Waveform Sequence
(003A,020C);LO;Channel Derivation Description
(003A,0210);DS;Channel Sensitivity
(003A,0211);SQ;Channel Sensitivity Units Sequence
(003A,0212);DS;Channel Sensitivity Correction Factor
(003A,0213);DS;Channel Baseline
(003A,0214);DS;Channel Time Skew
(003A,0215);DS;Channel Sample Skew
(003A,0218);DS;Channel Offset
(003A,021A);US;Waveform Bits Stored
(003A,0220);DS;Filter Low Frequency
(003A,0221);DS;Filter High Frequency
(003A,0222);DS;Notch Filter Frequency
(003A,0223);DS;Notch Filter Bandwidth
(003A,0230);FL;Waveform Data Display Scale
(003A,0231);US;Waveform Display Background CIELab Value
(003A,0240);SQ;Waveform Presentation Group Sequence
(003A,0241);US;Presentation Group Number
(003A,0242);SQ;Channel Display Sequence
(003A,0244);US;Channel Recommended Display CIELab Value
(003A,0245);FL;Channel Position
(003A,0246);CS;Display Shading Flag
(003A,0247);FL;Fractional Channel Display Scale
(003A,0248);FL;Absolute Channel Display Scale
(003A,0300);SQ;Multiplexed Audio Channels Description Code Sequence
(003A,0301);IS;Channel Identification Code
(003A,0302);CS;Channel Mode
(0040,0001);AE;Scheduled Station AE Title
(0040,0002);DA;Scheduled Procedure Step Start Date
(0040,0003);TM;Scheduled Procedure Step Start Time
(0040,0004);DA;Scheduled Procedure Step End Date
(0040,0005);TM;Scheduled Procedure Step End Time
(0040,0006);PN;Scheduled Performing Physician's Name
(0040,0007);LO;Scheduled Procedure Step Description
(0040,0008);SQ;Scheduled Protocol Code Sequence
(0040,0009);SH;Scheduled Procedure Step ID
(0040,000A);SQ;Stage Code Sequence
(0040,000B);SQ;Scheduled Performing Physician Identification Sequence
(0040,0010);SH;Scheduled Station Name
(0040,0011);SH;Scheduled Procedure Step Location
(0040,0012);LO;Pre-Medication
(0040,0020);CS;Scheduled Procedure Step Status
(0040,0026);SQ;Order Placer Identifier Sequence
(0040,0027);SQ;Order Filler Identifier Sequence
(0040,0031);UT;Local Namespace Entity ID
(0040,0032);UT;Universal Entity ID
(0040,0033);CS;Universal Entity ID Type
(0040,0035);CS;Identifier Type Code
(0040,0036);SQ;Assigning Facility Sequence
(0040,0039);SQ;Assigning Jurisdiction Code Sequence
(0040,003A);SQ;Assigning Agency or Department Code Sequence
(0040,0100);SQ;Scheduled Procedure Step Sequence
(0040,0220);SQ;Referenced Non-Image Composite SOP Instance Sequence
(0040,0241);AE;Performed Station AE Title
(0040,0242);SH;Performed Station Name
(0040,0243);SH;Performed Location
(0040,0244);DA;Performed Procedure Step Start Date
(0040,0245);TM;Performed Procedure Step Start Time
(0040,0250);DA;Performed Procedure Step End Date
(0040,0251);TM;Performed Procedure Step End Time
(0040,0252);CS;Performed Procedure Step Status
(0040,0253);SH;Performed Procedure Step ID
(0040,0254);LO;Performed Procedure Step Description
(0040,0255);LO;Performed Procedure Type Description
(0040,0260);SQ;Performed Protocol Code Sequence
(0040,0261);CS;Performed Protocol Type
(0040,0270);SQ;Scheduled Step Attributes Sequence
(0040,0275);SQ;Request Attributes Sequence
(0040,0280);ST;Comments on the Performed Procedure Step
(0040,0281);SQ;Performed Procedure Step Discontinuation Reason Code Sequence
(0040,0293);SQ;Quantity Sequence
(0040,0294);DS;Quantity
(0040,0295);SQ;Measuring Units Sequence
(0040,0296);SQ;Billing Item Sequence
(0040,0300);US;Total Time of Fluoroscopy
(0040,0301);US;Total Number of Exposures
(0040,0302);US;Entrance Dose
(0040,0303);US;Exposed Area
(0040,0306);DS;Distance Source to Entrance
(0040,0307);DS;Distance Source to Support
(0040,030E);SQ;Exposure Dose Sequence
(0040,0310);ST;Comments on Radiation Dose
(0040,0312);DS;X-Ray Output
(0040,0314);DS;Half Value Layer
(0040,0316);DS;Organ Dose
(0040,0318);CS;Organ Exposed
(0040,0320);SQ;Billing Procedure Step Sequence
(0040,0321);SQ;Film Consumption Sequence
(0040,0324);SQ;Billing Supplies and Devices Sequence
(0040,0330);SQ;Referenced Procedure Step Sequence
(0040,0340);SQ;Performed Series Sequence
(0040,0400);LT;Comments on the Scheduled Procedure Step
(0040,0440);SQ;Protocol Context Sequence
(0040,0441);SQ;Content Item Modifier Sequence
(0040,0500);SQ;Scheduled Specimen Sequence
(0040,050A);LO;Specimen Accession Number
(0040,0512);LO;Container Identifier
(0040,0513);SQ;Issuer of the Container Identifier Sequence
(0040,0515);SQ;Alternate Container Identifier Sequence
(0040,0518);SQ;Container Type Code Sequence
(0040,051A);LO;Container Description
(0040,0520);SQ;Container Component Sequence
(0040,0550);SQ;Specimen Sequence
(0040,0551);LO;Specimen Identifier
(0040,0552);SQ;Specimen Description Sequence (Trial)
(0040,0553);ST;Specimen Description (Trial)
(0040,0554);UI;Specimen UID
(0040,0555);SQ;Acquisition Context Sequence
(0040,0556);ST;Acquisition Context Description
(0040,059A);SQ;Specimen Type Code Sequence
(0040,0560);SQ;Specimen Description Sequence
(0040,0562);SQ;Issuer of the Specimen Identifier Sequence
(0040,0600);LO;Specimen Short Description
(0040,0602);UT;Specimen Detailed Description
(0040,0610);SQ;Specimen Preparation Sequence
(0040,0612);SQ;Specimen Preparation Step Content Item Sequence
(0040,0620);SQ;Specimen Localization Content Item Sequence
(0040,06FA);LO;Slide Identifier
(0040,071A);SQ;Image Center Point Coordinates Sequence
(0040,072A);DS;X Offset in Slide Coordinate System
(0040,073A);DS;Y Offset in Slide Coordinate System
(0040,074A);DS;Z Offset in Slide Coordinate System
(0040,08D8);SQ;Pixel Spacing Sequence
(0040,08DA);SQ;Coordinate System Axis Code Sequence
(0040,08EA);SQ;Measurement Units Code Sequence
(0040,09F8);SQ;Vital Stain Code Sequence (Trial)
(0040,1001);SH;Requested Procedure ID
(0040,1002);LO;Reason for the Requested Procedure
(0040,1003);SH;Requested Procedure Priority
(0040,1004);LO;Patient Transport Arrangements
(0040,1005);LO;Requested Procedure Location
(0040,1006);SH;Placer Order Number / Procedure
(0040,1007);SH;Filler Order Number / Procedure
(0040,1008);LO;Confidentiality Code
(0040,1009);SH;Reporting Priority
(0040,100A);SQ;Reason for Requested Procedure Code Sequence
(0040,1010);PN;Names of Intended Recipients of Results
(0040,1011);SQ;Intended Recipients of Results Identification Sequence
(0040,1012);SQ;Reason For Performed Procedure Code Sequence
(0040,1060);LO;Requested Procedure Description (Trial)
(0040,1101);SQ;Person Identification Code Sequence
(0040,1102);ST;Person's Address
(0040,1103);LO;Person's Telephone Numbers
(0040,1104);LT;Person's Telecom Information
(0040,1400);LT;Requested Procedure Comments
(0040,2001);LO;Reason for the Imaging Service Request
(0040,2004);DA;Issue Date of Imaging Service Request
(0040,2005);TM;Issue Time of Imaging Service Request
(0040,2006);SH;Placer Order Number / Imaging Service Request (Retired)
(0040,2007);SH;Filler Order Number / Imaging Service Request (Retired)
(0040,2008);PN;Order Entered By
(0040,2009);SH;Order Enterer's Location
(0040,2010);SH;Order Callback Phone Number
(0040,2011);LT;Order Callback Telecom Information
(0040,2016);LO;Placer Order Number / Imaging Service Request
(0040,2017);LO;Filler Order Number / Imaging Service Request
(0040,2400);LT;Imaging Service Request Comments
(0040,3001);LO;Confidentiality Constraint on Patient Data Description
(0040,4001);CS;General Purpose Scheduled Procedure Step Status
(0040,4002);CS;General Purpose Performed Procedure Step Status
(0040,4003);CS;General Purpose Scheduled Procedure Step Priority
(0040,4004);SQ;Scheduled Processing Applications Code Sequence
(0040,4005);DT;Scheduled Procedure Step Start DateTime
(0040,4006);CS;Multiple Copies Flag
(0040,4007);SQ;Performed Processing Applications Code Sequence
(0040,4009);SQ;Human Performer Code Sequence
(0040,4010);DT;Scheduled Procedure Step Modification DateTime
(0040,4011);DT;Expected Completion DateTime
(0040,4015);SQ;Resulting General Purpose Performed Procedure Steps Sequence
(0040,4016);SQ;Referenced General Purpose Scheduled Procedure Step Sequence
(0040,4018);SQ;Scheduled Workitem Code Sequence
(0040,4019);SQ;Performed Workitem Code Sequence
(0040,4020);CS;Input Availability Flag
(0040,4021);SQ;Input Information Sequence
(0040,4022);SQ;Relevant Information Sequence
(0040,4023);UI;Referenced General Purpose Scheduled Procedure Step Transaction UID
(0040,4025);SQ;Scheduled Station Name Code Sequence
(0040,4026);SQ;Scheduled Station Class Code Sequence
(0040,4027);SQ;Scheduled Station Geographic Location Code Sequence
(0040,4028);SQ;Performed Station Name Code Sequence
(0040,4029);SQ;Performed Station Class Code Sequence
(0040,4030);SQ;Performed Station Geographic Location Code Sequence
(0040,4031);SQ;Requested Subsequent Workitem Code Sequence
(0040,4032);SQ;Non-DICOM Output Code Sequence
(0040,4033);SQ;Output Information Sequence
(0040,4034);SQ;Scheduled Human Performers Sequence
(0040,4035);SQ;Actual Human Performers Sequence
(0040,4036);LO;Human Performer's Organization
(0040,4037);PN;Human Performer's Name
(0040,4040);CS;Raw Data Handling
(0040,4041);CS;Input Readiness State
(0040,4050);DT;Performed Procedure Step Start DateTime
(0040,4051);DT;Performed Procedure Step End DateTime
(0040,4052);DT;Procedure Step Cancellation DateTime
(0040,4070);SQ;Output Destination Sequence
(0040,4071);SQ;DICOM Storage Sequence
(0040,4072);SQ;STOW-RS Storage Sequence
(0040,4073);UR;Storage URL
(0040,4074);SQ;XDS Storage Sequence
(0040,8302);DS;Entrance Dose in mGy
(0040,9092);SQ;Parametric Map Frame Type Sequence
(0040,9094);SQ;Referenced Image Real World Value Mapping Sequence
(0040,9096);SQ;Real World Value Mapping Sequence
(0040,9098);SQ;Pixel Value Mapping Code Sequence
(0040,9210);SH;LUT Label
(0040,9211);US or SS;Real World Value Last Value Mapped
(0040,9212);FD;Real World Value LUT Data
(0040,9213);FD;Double Float Real World Value Last Value Mapped
(0040,9214);FD;Double Float Real World Value First Value Mapped
(0040,9216);US or SS;Real World Value First Value Mapped
(0040,9220);SQ;Quantity Definition Sequence
(0040,9224);FD;Real World Value Intercept
(0040,9225);FD;Real World Value Slope
(0040,A007);CS;Findings Flag (Trial)
(0040,A010);CS;Relationship Type
(0040,A020);SQ;Findings Sequence (Trial)
(0040,A021);UI;Findings Group UID (Trial)
(0040,A022);UI;Referenced Findings Group UID (Trial)
(0040,A023);DA;Findings Group Recording Date (Trial)
(0040,A024);TM;Findings Group Recording Time (Trial)
(0040,A026);SQ;Findings Source Category Code Sequence (Trial)
(0040,A027);LO;Verifying Organization
(0040,A028);SQ;Documenting Organization Identifier Code Sequence (Trial)
(0040,A030);DT;Verification DateTime
(0040,A032);DT;Observation DateTime
(0040,A040);CS;Value Type
(0040,A043);SQ;Concept Name Code Sequence
(0040,A047);LO;Measurement Precision Description (Trial)
(0040,A050);CS;Continuity Of Content
(0040,A057);CS;Urgency or Priority Alerts (Trial)
(0040,A060);LO;Sequencing Indicator (Trial)
(0040,A066);SQ;Document Identifier Code Sequence (Trial)
(0040,A067);PN;Document Author (Trial)
(0040,A068);SQ;Document Author Identifier Code Sequence (Trial)
(0040,A070);SQ;Identifier Code Sequence (Trial)
(0040,A073);SQ;Verifying Observer Sequence
(0040,A074);OB;Object Binary Identifier (Trial)
(0040,A075);PN;Verifying Observer Name
(0040,A076);SQ;Documenting Observer Identifier Code Sequence (Trial)
(0040,A078);SQ;Author Observer Sequence
(0040,A07A);SQ;Participant Sequence
(0040,A07C);SQ;Custodial Organization Sequence
(0040,A080);CS;Participation Type
(0040,A082);DT;Participation DateTime
(0040,A084);CS;Observer Type
(0040,A085);SQ;Procedure Identifier Code Sequence (Trial)
(0040,A088);SQ;Verifying Observer Identification Code Sequence
(0040,A089);OB;Object Directory Binary Identifier (Trial)
(0040,A090);SQ;Equivalent CDA Document Sequence
(0040,A0B0);US;Referenced Waveform Channels
(0040,A110);DA;Date of Document or Verbal Transaction (Trial)
(0040,A112);TM;Time of Document Creation or Verbal Transaction (Trial)
(0040,A120);DT;DateTime
(0040,A121);DA;Date
(0040,A122);TM;Time
(0040,A123);PN;Person Name
(0040,A124);UI;UID
(0040,A125);CS;Report Status ID (Trial)
(0040,A130);CS;Temporal Range Type
(0040,A132);UL;Referenced Sample Positions
(0040,A136);US;Referenced Frame Numbers
(0040,A138);DS;Referenced Time Offsets
(0040,A13A);DT;Referenced DateTime
(0040,A160);UT;Text Value
(0040,A161);FD;Floating Point Value
(0040,A162);SL;Rational Numerator Value
(0040,A163);UL;Rational Denominator Value
(0040,A167);SQ;Observation Category Code Sequence (Trial)
(0040,A168);SQ;Concept Code Sequence
(0040,A16A);ST;Bibliographic Citation (Trial)
(0040,A170);SQ;Purpose of Reference Code Sequence
(0040,A171);UI;Observation UID
(0040,A172);UI;Referenced Observation UID (Trial)
(0040,A173);CS;Referenced Observation Class (Trial)
(0040,A174);CS;Referenced Object Observation Class (Trial)
(0040,A180);US;Annotation Group Number
(0040,A192);DA;Observation Date (Trial)
(0040,A193);TM;Observation Time (Trial)
(0040,A194);CS;Measurement Automation (Trial)
(0040,A195);SQ;Modifier Code Sequence
(0040,A224);ST;Identification Description (Trial)
(0040,A290);CS;Coordinates Set Geometric Type (Trial)
(0040,A296);SQ;Algorithm Code Sequence (Trial)
(0040,A297);ST;Algorithm Description (Trial)
(0040,A29A);SL;Pixel Coordinates Set (Trial)
(0040,A300);SQ;Measured Value Sequence
(0040,A301);SQ;Numeric Value Qualifier Code Sequence
(0040,A307);PN;Current Observer (Trial)
(0040,A30A);DS;Numeric Value
(0040,A313);SQ;Referenced Accession Sequence (Trial)
(0040,A33A);ST;Report Status Comment (Trial)
(0040,A340);SQ;Procedure Context Sequence (Trial)
(0040,A352);PN;Verbal Source (Trial)
(0040,A353);ST;Address (Trial)
(0040,A354);LO;Telephone Number (Trial)
(0040,A358);SQ;Verbal Source Identifier Code Sequence (Trial)
(0040,A360);SQ;Predecessor Documents Sequence
(0040,A370);SQ;Referenced Request Sequence
(0040,A372);SQ;Performed Procedure Code Sequence
(0040,A375);SQ;Current Requested Procedure Evidence Sequence
(0040,A380);SQ;Report Detail Sequence (Trial)
(0040,A385);SQ;Pertinent Other Evidence Sequence
(0040,A390);SQ;HL7 Structured Document Reference Sequence
(0040,A402);UI;Observation Subject UID (Trial)
(0040,A403);CS;Observation Subject Class (Trial)
(0040,A404);SQ;Observation Subject Type Code Sequence (Trial)
(0040,A491);CS;Completion Flag
(0040,A492);LO;Completion Flag Description
(0040,A493);CS;Verification Flag
(0040,A494);CS;Archive Requested
(0040,A496);CS;Preliminary Flag
(0040,A504);SQ;Content Template Sequence
(0040,A525);SQ;Identical Documents Sequence
(0040,A600);CS;Observation Subject Context Flag (Trial)
(0040,A601);CS;Observer Context Flag (Trial)
(0040,A603);CS;Procedure Context Flag (Trial)
(0040,A730);SQ;Content Sequence
(0040,A731);SQ;Relationship Sequence (Trial)
(0040,A732);SQ;Relationship Type Code Sequence (Trial)
(0040,A744);SQ;Language Code Sequence (Trial)
(0040,A992);ST;Uniform Resource Locator (Trial)
(0040,B020);SQ;Waveform Annotation Sequence
(0040,DB00);CS;Template Identifier
(0040,DB06);DT;Template Version
(0040,DB07);DT;Template Local Version
(0040,DB0B);CS;Template Extension Flag
(0040,DB0C);UI;Template Extension Organization UID
(0040,DB0D);UI;Template Extension Creator UID
(0040,DB73);UL;Referenced Content Item Identifier
(0040,E001);ST;HL7 Instance Identifier
(0040,E004);DT;HL7 Document Effective Time
(0040,E006);SQ;HL7 Document Type Code Sequence
(0040,E008);SQ;Document Class Code Sequence
(0040,E010);UR;Retrieve URI
(0040,E011);UI;Retrieve Location UID
(0040,E020);CS;Type of Instances
(0040,E021);SQ;DICOM Retrieval Sequence
(0040,E022);SQ;DICOM Media Retrieval Sequence
(0040,E023);SQ;WADO Retrieval Sequence
(0040,E024);SQ;XDS Retrieval Sequence
(0040,E025);SQ;WADO-RS Retrieval Sequence
(0040,E030);UI;Repository Unique ID
(0040,E031);UI;Home Community ID
(0042,0010);ST;Document Title
(0042,0011);OB;Encapsulated Document
(0042,0012);LO;MIME Type of Encapsulated Document
(0042,0013);SQ;Source Instance Sequence
(0042,0014);LO;List of MIME Types
(0044,0001);ST;Product Package Identifier
(0044,0002);CS;Substance Administration Approval
(0044,0003);LT;Approval Status Further Description
(0044,0004);DT;Approval Status DateTime
(0044,0007);SQ;Product Type Code Sequence
(0044,0008);LO;Product Name
(0044,0009);LT;Product Description
(0044,000A);LO;Product Lot Identifier
(0044,000B);DT;Product Expiration DateTime
(0044,0010);DT;Substance Administration DateTime
(0044,0011);LO;Substance Administration Notes
(0044,0012);LO;Substance Administration Device ID
(0044,0013);SQ;Product Parameter Sequence
(0044,0019);SQ;Substance Administration Parameter Sequence
(0046,0012);LO;Lens Description
(0046,0014);SQ;Right Lens Sequence
(0046,0015);SQ;Left Lens Sequence
(0046,0016);SQ;Unspecified Laterality Lens Sequence
(0046,0018);SQ;Cylinder Sequence
(0046,0028);SQ;Prism Sequence
(0046,0030);FD;Horizontal Prism Power
(0046,0032);CS;Horizontal Prism Base
(0046,0034);FD;Vertical Prism Power
(0046,0036);CS;Vertical Prism Base
(0046,0038);CS;Lens Segment Type
(0046,0040);FD;Optical Transmittance
(0046,0042);FD;Channel Width
(0046,0044);FD;Pupil Size
(0046,0046);FD;Corneal Size
(0046,0050);SQ;Autorefraction Right Eye Sequence
(0046,0052);SQ;Autorefraction Left Eye Sequence
(0046,0060);FD;Distance Pupillary Distance
(0046,0062);FD;Near Pupillary Distance
(0046,0063);FD;Intermediate Pupillary Distance
(0046,0064);FD;Other Pupillary Distance
(0046,0070);SQ;Keratometry Right Eye Sequence
(0046,0071);SQ;Keratometry Left Eye Sequence
(0046,0074);SQ;Steep Keratometric Axis Sequence
(0046,0075);FD;Radius of Curvature
(0046,0076);FD;Keratometric Power
(0046,0077);FD;Keratometric Axis
(0046,0080);SQ;Flat Keratometric Axis Sequence
(0046,0092);CS;Background Color
(0046,0094);CS;Optotype
(0046,0095);CS;Optotype Presentation
(0046,0097);SQ;Subjective Refraction Right Eye Sequence
(0046,0098);SQ;Subjective Refraction Left Eye Sequence
(0046,0100);SQ;Add Near Sequence
(0046,0101);SQ;Add Intermediate Sequence
(0046,0102);SQ;Add Other Sequence
(0046,0104);FD;Add Power
(0046,0106);FD;Viewing Distance
(0046,0121);SQ;Visual Acuity Type Code Sequence
(0046,0122);SQ;Visual Acuity Right Eye Sequence
(0046,0123);SQ;Visual Acuity Left Eye Sequence
(0046,0124);SQ;Visual Acuity Both Eyes Open Sequence
(0046,0125);CS;Viewing Distance Type
(0046,0135);SS;Visual Acuity Modifiers
(0046,0137);FD;Decimal Visual Acuity
(0046,0139);LO;Optotype Detailed Definition
(0046,0145);SQ;Referenced Refractive Measurements Sequence
(0046,0146);FD;Sphere Power
(0046,0147);FD;Cylinder Power
(0046,0201);CS;Corneal Topography Surface
(0046,0202);FL;Corneal Vertex Location
(0046,0203);FL;Pupil Centroid X-Coordinate
(0046,0204);FL;Pupil Centroid Y-Coordinate
(0046,0205);FL;Equivalent Pupil Radius
(0046,0207);SQ;Corneal Topography Map Type Code Sequence
(0046,0208);IS;Vertices of the Outline of Pupil
(0046,0210);SQ;Corneal Topography Mapping Normals Sequence
(0046,0211);SQ;Maximum Corneal Curvature Sequence
(0046,0212);FL;Maximum Corneal Curvature
(0046,0213);FL;Maximum Corneal Curvature Location
(0046,0215);SQ;Minimum Keratometric Sequence
(0046,0218);SQ;Simulated Keratometric Cylinder Sequence
(0046,0220);FL;Average Corneal Power
(0046,0224);FL;Corneal I-S Value
(0046,0227);FL;Analyzed Area
(0046,0230);FL;Surface Regularity Index
(0046,0232);FL;Surface Asymmetry Index
(0046,0234);FL;Corneal Eccentricity Index
(0046,0236);FL;Keratoconus Prediction Index
(0046,0238);FL;Decimal Potential Visual Acuity
(0046,0242);CS;Corneal Topography Map Quality Evaluation
(0046,0244);SQ;Source Image Corneal Processed Data Sequence
(0046,0247);FL;Corneal Point Location
(0046,0248);CS;Corneal Point Estimated
(0046,0249);FL;Axial Power
(0046,0250);FL;Tangential Power
(0046,0251);FL;Refractive Power
(0046,0252);FL;Relative Elevation
(0046,0253);FL;Corneal Wavefront
(0048,0001);FL;Imaged Volume Width
(0048,0002);FL;Imaged Volume Height
(0048,0003);FL;Imaged Volume Depth
(0048,0006);UL;Total Pixel Matrix Columns
(0048,0007);UL;Total Pixel Matrix Rows
(0048,0008);SQ;Total Pixel Matrix Origin Sequence
(0048,0010);CS;Specimen Label in Image
(0048,0011);CS;Focus Method
(0048,0012);CS;Extended Depth of Field
(0048,0013);US;Number of Focal Planes
(0048,0014);FL;Distance Between Focal Planes
(0048,0015);US;Recommended Absent Pixel CIELab Value
(0048,0100);SQ;Illuminator Type Code Sequence
(0048,0102);DS;Image Orientation (Slide)
(0048,0105);SQ;Optical Path Sequence
(0048,0106);SH;Optical Path Identifier
(0048,0107);ST;Optical Path Description
(0048,0108);SQ;Illumination Color Code Sequence
(0048,0110);SQ;Specimen Reference Sequence
(0048,0111);DS;Condenser Lens Power
(0048,0112);DS;Objective Lens Power
(0048,0113);DS;Objective Lens Numerical Aperture
(0048,0120);SQ;Palette Color Lookup Table Sequence
(0048,0200);SQ;Referenced Image Navigation Sequence
(0048,0201);US;Top Left Hand Corner of Localizer Area
(0048,0202);US;Bottom Right Hand Corner of Localizer Area
(0048,0207);SQ;Optical Path Identification Sequence
(0048,021A);SQ;Plane Position (Slide) Sequence
(0048,021E);SL;Column Position In Total Image Pixel Matrix
(0048,021F);SL;Row Position In Total Image Pixel Matrix
(0048,0301);CS;Pixel Origin Interpretation
(0050,0004);CS;Calibration Image
(0050,0010);SQ;Device Sequence
(0050,0012);SQ;Container Component Type Code Sequence
(0050,0013);FD;Container Component Thickness
(0050,0014);DS;Device Length
(0050,0015);FD;Container Component Width
(0050,0016);DS;Device Diameter
(0050,0017);CS;Device Diameter Units
(0050,0018);DS;Device Volume
(0050,0019);DS;Inter-Marker Distance
(0050,001A);CS;Container Component Material
(0050,001B);LO;Container Component ID
(0050,001C);FD;Container Component Length
(0050,001D);FD;Container Component Diameter
(0050,001E);LO;Container Component Description
(0050,0020);LO;Device Description
(0052,0001);FL;Contrast/Bolus Ingredient Percent by Volume
(0052,0002);FD;OCT Focal Distance
(0052,0003);FD;Beam Spot Size
(0052,0004);FD;Effective Refractive Index
(0052,0006);CS;OCT Acquisition Domain
(0052,0007);FD;OCT Optical Center Wavelength
(0052,0008);FD;Axial Resolution
(0052,0009);FD;Ranging Depth
(0052,0011);FD;A-line Rate
(0052,0012);US;A-lines Per Frame
(0052,0013);FD;Catheter Rotational Rate
(0052,0014);FD;A-line Pixel Spacing
(0052,0016);SQ;Mode of Percutaneous Access Sequence
(0052,0025);SQ;Intravascular OCT Frame Type Sequence
(0052,0026);CS;OCT Z Offset Applied
(0052,0027);SQ;Intravascular Frame Content Sequence
(0052,0028);FD;Intravascular Longitudinal Distance
(0052,0029);SQ;Intravascular OCT Frame Content Sequence
(0052,0030);SS;OCT Z Offset Correction
(0052,0031);CS;Catheter Direction of Rotation
(0052,0033);FD;Seam Line Location
(0052,0034);FD;First A-line Location
(0052,0036);US;Seam Line Index
(0052,0038);US;Number of Padded A-lines
(0052,0039);CS;Interpolation Type
(0052,003A);CS;Refractive Index Applied
(0054,0010);US;Energy Window Vector
(0054,0011);US;Number of Energy Windows
(0054,0012);SQ;Energy Window Information Sequence
(0054,0013);SQ;Energy Window Range Sequence
(0054,0014);DS;Energy Window Lower Limit
(0054,0015);DS;Energy Window Upper Limit
(0054,0016);SQ;Radiopharmaceutical Information Sequence
(0054,0017);IS;Residual Syringe Counts
(0054,0018);SH;Energy Window Name
(0054,0020);US;Detector Vector
(0054,0021);US;Number of Detectors
(0054,0022);SQ;Detector Information Sequence
(0054,0030);US;Phase Vector
(0054,0031);US;Number of Phases
(0054,0032);SQ;Phase Information Sequence
(0054,0033);US;Number of Frames in Phase
(0054,0036);IS;Phase Delay
(0054,0038);IS;Pause Between Frames
(0054,0039);CS;Phase Description
(0054,0050);US;Rotation Vector
(0054,0051);US;Number of Rotations
(0054,0052);SQ;Rotation Information Sequence
(0054,0053);US;Number of Frames in Rotation
(0054,0060);US;R-R Interval Vector
(0054,0061);US;Number of R-R Intervals
(0054,0062);SQ;Gated Information Sequence
(0054,0063);SQ;Data Information Sequence
(0054,0070);US;Time Slot Vector
(0054,0071);US;Number of Time Slots
(0054,0072);SQ;Time Slot Information Sequence
(0054,0073);DS;Time Slot Time
(0054,0080);US;Slice Vector
(0054,0081);US;Number of Slices
(0054,0090);US;Angular View Vector
(0054,0100);US;Time Slice Vector
(0054,0101);US;Number of Time Slices
(0054,0200);DS;Start Angle
(0054,0202);CS;Type of Detector Motion
(0054,0210);IS;Trigger Vector
(0054,0211);US;Number of Triggers in Phase
(0054,0220);SQ;View Code Sequence
(0054,0222);SQ;View Modifier Code Sequence
(0054,0300);SQ;Radionuclide Code Sequence
(0054,0302);SQ;Administration Route Code Sequence
(0054,0304);SQ;Radiopharmaceutical Code Sequence
(0054,0306);SQ;Calibration Data Sequence
(0054,0308);US;Energy Window Number
(0054,0400);SH;Image ID
(0054,0410);SQ;Patient Orientation Code Sequence
(0054,0412);SQ;Patient Orientation Modifier Code Sequence
(0054,0414);SQ;Patient Gantry Relationship Code Sequence
(0054,0500);CS;Slice Progression Direction
(0054,0501);CS;Scan Progression Direction
(0054,1000);CS;Series Type
(0054,1001);CS;Units
(0054,1002);CS;Counts Source
(0054,1004);CS;Reprojection Method
(0054,1006);CS;SUV Type
(0054,1100);CS;Randoms Correction Method
(0054,1101);LO;Attenuation Correction Method
(0054,1102);CS;Decay Correction
(0054,1103);LO;Reconstruction Method
(0054,1104);LO;Detector Lines of Response Used
(0054,1105);LO;Scatter Correction Method
(0054,1200);DS;Axial Acceptance
(0054,1201);IS;Axial Mash
(0054,1202);IS;Transverse Mash
(0054,1203);DS;Detector Element Size
(0054,1210);DS;Coincidence Window Width
(0054,1220);CS;Secondary Counts Type
(0054,1300);DS;Frame Reference Time
(0054,1310);IS;Primary (Prompts) Counts Accumulated
(0054,1311);IS;Secondary Counts Accumulated
(0054,1320);DS;Slice Sensitivity Factor
(0054,1321);DS;Decay Factor
(0054,1322);DS;Dose Calibration Factor
(0054,1323);DS;Scatter Fraction Factor
(0054,1324);DS;Dead Time Factor
(0054,1330);US;Image Index
(0054,1400);CS;Counts Included
(0054,1401);CS;Dead Time Correction Flag
(0060,3000);SQ;Histogram Sequence
(0060,3002);US;Histogram Number of Bins
(0060,3004);US or SS;Histogram First Bin Value
(0060,3006);US or SS;Histogram Last Bin Value
(0060,3008);US;Histogram Bin Width
(0060,3010);LO;Histogram Explanation
(0060,3020);UL;Histogram Data
(0062,0001);CS;Segmentation Type
(0062,0002);SQ;Segment Sequence
(0062,0003);SQ;Segmented Property Category Code Sequence
(0062,0004);US;Segment Number
(0062,0005);LO;Segment Label
(0062,0006);ST;Segment Description
(0062,0008);CS;Segment Algorithm Type
(0062,0009);LO;Segment Algorithm Name
(0062,000A);SQ;Segment Identification Sequence
(0062,000B);US;Referenced Segment Number
(0062,000C);US;Recommended Display Grayscale Value
(0062,000D);US;Recommended Display CIELab Value
(0062,000E);US;Maximum Fractional Value
(0062,000F);SQ;Segmented Property Type Code Sequence
(0062,0010);CS;Segmentation Fractional Type
(0062,0011);SQ;Segmented Property Type Modifier Code Sequence
(0062,0012);SQ;Used Segments Sequence
(0062,0020);UT;Tracking ID
(0062,0021);UI;Tracking UID
(0064,0002);SQ;Deformable Registration Sequence
(0064,0003);UI;Source Frame of Reference UID
(0064,0005);SQ;Deformable Registration Grid Sequence
(0064,0007);UL;Grid Dimensions
(0064,0008);FD;Grid Resolution
(0064,0009);OF;Vector Grid Data
(0064,000F);SQ;Pre Deformation Matrix Registration Sequence
(0064,0010);SQ;Post Deformation Matrix Registration Sequence
(0066,0001);UL;Number of Surfaces
(0066,0002);SQ;Surface Sequence
(0066,0003);UL;Surface Number
(0066,0004);LT;Surface Comments
(0066,0009);CS;Surface Processing
(0066,000A);FL;Surface Processing Ratio
(0066,000B);LO;Surface Processing Description
(0066,000C);FL;Recommended Presentation Opacity
(0066,000D);CS;Recommended Presentation Type
(0066,000E);CS;Finite Volume
(0066,0010);CS;Manifold
(0066,0011);SQ;Surface Points Sequence
(0066,0012);SQ;Surface Points Normals Sequence
(0066,0013);SQ;Surface Mesh Primitives Sequence
(0066,0015);UL;Number of Surface Points
(0066,0016);OF;Point Coordinates Data
(0066,0017);FL;Point Position Accuracy
(0066,0018);FL;Mean Point Distance
(0066,0019);FL;Maximum Point Distance
(0066,001A);FL;Points Bounding Box Coordinates
(0066,001B);FL;Axis of Rotation
(0066,001C);FL;Center of Rotation
(0066,001E);UL;Number of Vectors
(0066,001F);US;Vector Dimensionality
(0066,0020);FL;Vector Accuracy
(0066,0021);OF;Vector Coordinate Data
(0066,0023);OW;Triangle Point Index List
(0066,0024);OW;Edge Point Index List
(0066,0025);OW;Vertex Point Index List
(0066,0026);SQ;Triangle Strip Sequence
(0066,0027);SQ;Triangle Fan Sequence
(0066,0028);SQ;Line Sequence
(0066,0029);OW;Primitive Point Index List
(0066,002A);UL;Surface Count
(0066,002B);SQ;Referenced Surface Sequence
(0066,002C);UL;Referenced Surface Number
(0066,002D);SQ;Segment Surface Generation Algorithm Identification Sequence
(0066,002E);SQ;Segment Surface Source Instance Sequence
(0066,002F);SQ;Algorithm Family Code Sequence
(0066,0030);SQ;Algorithm Name Code Sequence
(0066,0031);LO;Algorithm Version
(0066,0032);LT;Algorithm Parameters
(0066,0034);SQ;Facet Sequence
(0066,0035);SQ;Surface Processing Algorithm Identification Sequence
(0066,0036);LO;Algorithm Name
(0066,0037);FL;Recommended Point Radius
(0066,0038);FL;Recommended Line Thickness
(0066,0040);OL;Long Primitive Point Index List
(0066,0041);OL;Long Triangle Point Index List
(0066,0042);OL;Long Edge Point Index List
(0066,0043);OL;Long Vertex Point Index List
(0066,0101);SQ;Track Set Sequence
(0066,0102);SQ;Track Sequence
(0066,0103);OW;Recommended Display CIELab Value List
(0066,0104);SQ;Tracking Algorithm Identification Sequence
(0066,0105);UL;Track Set Number
(0066,0106);LO;Track Set Label
(0066,0107);UT;Track Set Description
(0066,0108);SQ;Track Set Anatomical Type Code Sequence
(0066,0121);SQ;Measurements Sequence
(0066,0124);SQ;Track Set Statistics Sequence
(0066,0125);OF;Floating Point Values
(0066,0129);OL;Track Point Index List
(0066,0130);SQ;Track Statistics Sequence
(0066,0132);SQ;Measurement Values Sequence
(0066,0133);SQ;Diffusion Acquisition Code Sequence
(0066,0134);SQ;Diffusion Model Code Sequence
(0068,6210);LO;Implant Size
(0068,6221);LO;Implant Template Version
(0068,6222);SQ;Replaced Implant Template Sequence
(0068,6223);CS;Implant Type
(0068,6224);SQ;Derivation Implant Template Sequence
(0068,6225);SQ;Original Implant Template Sequence
(0068,6226);DT;Effective DateTime
(0068,6230);SQ;Implant Target Anatomy Sequence
(0068,6260);SQ;Information From Manufacturer Sequence
(0068,6265);SQ;Notification From Manufacturer Sequence
(0068,6270);DT;Information Issue DateTime
(0068,6280);ST;Information Summary
(0068,62A0);SQ;Implant Regulatory Disapproval Code Sequence
(0068,62A5);FD;Overall Template Spatial Tolerance
(0068,62C0);SQ;HPGL Document Sequence
(0068,62D0);US;HPGL Document ID
(0068,62D5);LO;HPGL Document Label
(0068,62E0);SQ;View Orientation Code Sequence
(0068,62F0);FD;View Orientation Modifier
(0068,62F2);FD;HPGL Document Scaling
(0068,6300);OB;HPGL Document
(0068,6310);US;HPGL Contour Pen Number
(0068,6320);SQ;HPGL Pen Sequence
(0068,6330);US;HPGL Pen Number
(0068,6340);LO;HPGL Pen Label
(0068,6345);ST;HPGL Pen Description
(0068,6346);FD;Recommended Rotation Point
(0068,6347);FD;Bounding Rectangle
(0068,6350);US;Implant Template 3D Model Surface Number
(0068,6360);SQ;Surface Model Description Sequence
(0068,6380);LO;Surface Model Label
(0068,6390);FD;Surface Model Scaling Factor
(0068,63A0);SQ;Materials Code Sequence
(0068,63A4);SQ;Coating Materials Code Sequence
(0068,63A8);SQ;Implant Type Code Sequence
(0068,63AC);SQ;Fixation Method Code Sequence
(0068,63B0);SQ;Mating Feature Sets Sequence
(0068,63C0);US;Mating Feature Set ID
(0068,63D0);LO;Mating Feature Set Label
(0068,63E0);SQ;Mating Feature Sequence
(0068,63F0);US;Mating Feature ID
(0068,6400);SQ;Mating Feature Degree of Freedom Sequence
(0068,6410);US;Degree of Freedom ID
(0068,6420);CS;Degree of Freedom Type
(0068,6430);SQ;2D Mating Feature Coordinates Sequence
(0068,6440);US;Referenced HPGL Document ID
(0068,6450);FD;2D Mating Point
(0068,6460);FD;2D Mating Axes
(0068,6470);SQ;2D Degree of Freedom Sequence
(0068,6490);FD;3D Degree of Freedom Axis
(0068,64A0);FD;Range of Freedom
(0068,64C0);FD;3D Mating Point
(0068,64D0);FD;3D Mating Axes
(0068,64F0);FD;2D Degree of Freedom Axis
(0068,6500);SQ;Planning Landmark Point Sequence
(0068,6510);SQ;Planning Landmark Line Sequence
(0068,6520);SQ;Planning Landmark Plane Sequence
(0068,6530);US;Planning Landmark ID
(0068,6540);LO;Planning Landmark Description
(0068,6545);SQ;Planning Landmark Identification Code Sequence
(0068,6550);SQ;2D Point Coordinates Sequence
(0068,6560);FD;2D Point Coordinates
(0068,6590);FD;3D Point Coordinates
(0068,65A0);SQ;2D Line Coordinates Sequence
(0068,65B0);FD;2D Line Coordinates
(0068,65D0);FD;3D Line Coordinates
(0068,65E0);SQ;2D Plane Coordinates Sequence
(0068,65F0);FD;2D Plane Intersection
(0068,6610);FD;3D Plane Origin
(0068,6620);FD;3D Plane Normal
(0070,0001);SQ;Graphic Annotation Sequence
(0070,0002);CS;Graphic Layer
(0070,0003);CS;Bounding Box Annotation Units
(0070,0004);CS;Anchor Point Annotation Units
(0070,0005);CS;Graphic Annotation Units
(0070,0006);ST;Unformatted Text Value
(0070,0008);SQ;Text Object Sequence
(0070,0009);SQ;Graphic Object Sequence
(0070,0010);FL;Bounding Box Top Left Hand Corner
(0070,0011);FL;Bounding Box Bottom Right Hand Corner
(0070,0012);CS;Bounding Box Text Horizontal Justification
(0070,0014);FL;Anchor Point
(0070,0015);CS;Anchor Point Visibility
(0070,0020);US;Graphic Dimensions
(0070,0021);US;Number of Graphic Points
(0070,0022);FL;Graphic Data
(0070,0023);CS;Graphic Type
(0070,0024);CS;Graphic Filled
(0070,0040);IS;Image Rotation (Retired)
(0070,0041);CS;Image Horizontal Flip
(0070,0042);US;Image Rotation
(0070,0050);US;Displayed Area Top Left Hand Corner (Trial)
(0070,0051);US;Displayed Area Bottom Right Hand Corner (Trial)
(0070,0052);SL;Displayed Area Top Left Hand Corner
(0070,0053);SL;Displayed Area Bottom Right Hand Corner
(0070,005A);SQ;Displayed Area Selection Sequence
(0070,0060);SQ;Graphic Layer Sequence
(0070,0062);IS;Graphic Layer Order
(0070,0066);US;Graphic Layer Recommended Display Grayscale Value
(0070,0067);US;Graphic Layer Recommended Display RGB Value
(0070,0068);LO;Graphic Layer Description
(0070,0080);CS;Content Label
(0070,0081);LO;Content Description
(0070,0082);DA;Presentation Creation Date
(0070,0083);TM;Presentation Creation Time
(0070,0084);PN;Content Creator's Name
(0070,0086);SQ;Content Creator's Identification Code Sequence
(0070,0087);SQ;Alternate Content Description Sequence
(0070,0100);CS;Presentation Size Mode
(0070,0101);DS;Presentation Pixel Spacing
(0070,0102);IS;Presentation Pixel Aspect Ratio
(0070,0103);FL;Presentation Pixel Magnification Ratio
(0070,0207);LO;Graphic Group Label
(0070,0208);ST;Graphic Group Description
(0070,0209);SQ;Compound Graphic Sequence
(0070,0226);UL;Compound Graphic Instance ID
(0070,0227);LO;Font Name
(0070,0228);CS;Font Name Type
(0070,0229);LO;CSS Font Name
(0070,0230);FD;Rotation Angle
(0070,0231);SQ;Text Style Sequence
(0070,0232);SQ;Line Style Sequence
(0070,0233);SQ;Fill Style Sequence
(0070,0234);SQ;Graphic Group Sequence
(0070,0241);US;Text Color CIELab Value
(0070,0242);CS;Horizontal Alignment
(0070,0243);CS;Vertical Alignment
(0070,0244);CS;Shadow Style
(0070,0245);FL;Shadow Offset X
(0070,0246);FL;Shadow Offset Y
(0070,0247);US;Shadow Color CIELab Value
(0070,0248);CS;Underlined
(0070,0249);CS;Bold
(0070,0250);CS;Italic
(0070,0251);US;Pattern On Color CIELab Value
(0070,0252);US;Pattern Off Color CIELab Value
(0070,0253);FL;Line Thickness
(0070,0254);CS;Line Dashing Style
(0070,0255);UL;Line Pattern
(0070,0256);OB;Fill Pattern
(0070,0257);CS;Fill Mode
(0070,0258);FL;Shadow Opacity
(0070,0261);FL;Gap Length
(0070,0262);FL;Diameter of Visibility
(0070,0273);FL;Rotation Point
(0070,0274);CS;Tick Alignment
(0070,0278);CS;Show Tick Label
(0070,0279);CS;Tick Label Alignment
(0070,0282);CS;Compound Graphic Units
(0070,0284);FL;Pattern On Opacity
(0070,0285);FL;Pattern Off Opacity
(0070,0287);SQ;Major Ticks Sequence
(0070,0288);FL;Tick Position
(0070,0289);SH;Tick Label
(0070,0294);CS;Compound Graphic Type
(0070,0295);UL;Graphic Group ID
(0070,0306);CS;Shape Type
(0070,0308);SQ;Registration Sequence
(0070,0309);SQ;Matrix Registration Sequence
(0070,030A);SQ;Matrix Sequence
(0070,030B);FD;Frame of Reference to Displayed Coordinate System Transformation Matrix
(0070,030C);CS;Frame of Reference Transformation Matrix Type
(0070,030D);SQ;Registration Type Code Sequence
(0070,030F);ST;Fiducial Description
(0070,0310);SH;Fiducial Identifier
(0070,0311);SQ;Fiducial Identifier Code Sequence
(0070,0312);FD;Contour Uncertainty Radius
(0070,0314);SQ;Used Fiducials Sequence
(0070,0318);SQ;Graphic Coordinates Data Sequence
(0070,031A);UI;Fiducial UID
(0070,031C);SQ;Fiducial Set Sequence
(0070,031E);SQ;Fiducial Sequence
(0070,0401);US;Graphic Layer Recommended Display CIELab Value
(0070,0402);SQ;Blending Sequence
(0070,0403);FL;Relative Opacity
(0070,0404);SQ;Referenced Spatial Registration Sequence
(0070,0405);CS;Blending Position
(0070,1101);UI;Presentation Display Collection UID
(0070,1102);UI;Presentation Sequence Collection UID
(0070,1103);US;Presentation Sequence Position Index
(0070,1104);SQ;Rendered Image Reference Sequence
(0070,1201);SQ;Volumetric Presentation State Input Sequence
(0070,1202);CS;Presentation Input Type
(0070,1203);US;Input Sequence Position Index
(0070,1204);CS;Crop
(0070,1205);US;Cropping Specification Index
(0070,1206);CS;Compositing Method
(0070,1207);US;Volumetric Presentation Input Number
(0070,1208);CS;Image Volume Geometry
(0070,1301);SQ;Volume Cropping Sequence
(0070,1302);CS;Volume Cropping Method
(0070,1303);FD;Bounding Box Crop
(0070,1304);SQ;Oblique Cropping Plane Sequence
(0070,1305);FD;Plane
(0070,1306);FD;Plane Normal
(0070,1309);US;Cropping Specification Number
(0070,1501);CS;Multi-Planar Reconstruction Style
(0070,1502);CS;MPR Thickness Type
(0070,1503);FD;MPR Slab Thickness
(0070,1505);FD;MPR Top Left Hand Corner
(0070,1507);FD;MPR View Width Direction
(0070,1508);FD;MPR View Width
(0070,150C);UL;Number of Volumetric Curve Points
(0070,150D);OD;Volumetric Curve Points
(0070,1511);FD;MPR View Height Direction
(0070,1512);FD;MPR View Height
(0070,1801);SQ;Presentation State Classification Component Sequence
(0070,1802);CS;Component Type
(0070,1803);SQ;Component Input Sequence
(0070,1804);US;Volumetric Presentation Input Index
(0070,1805);SQ;Presentation State Compositor Component Sequence
(0070,1806);SQ;Weighting Transfer Function Sequence
(0070,1807);US;Weighting Lookup Table Descriptor
(0070,1808);OB;Weighting Lookup Table Data
(0070,1901);SQ;Volumetric Annotation Sequence
(0070,1903);SQ;Referenced Structured Context Sequence
(0070,1904);UI;Referenced Content Item
(0070,1905);SQ;Volumetric Presentation Input Annotation Sequence
(0070,1907);CS;Annotation Clipping
(0070,1A01);CS;Presentation Animation Style
(0070,1A03);FD;Recommended Animation Rate
(0070,1A04);SQ;Animation Curve Sequence
(0070,1A05);FD;Animation Step Size
(0072,0002);SH;Hanging Protocol Name
(0072,0004);LO;Hanging Protocol Description
(0072,0006);CS;Hanging Protocol Level
(0072,0008);LO;Hanging Protocol Creator
(0072,000A);DT;Hanging Protocol Creation DateTime
(0072,000C);SQ;Hanging Protocol Definition Sequence
(0072,000E);SQ;Hanging Protocol User Identification Code Sequence
(0072,0010);LO;Hanging Protocol User Group Name
(0072,0012);SQ;Source Hanging Protocol Sequence
(0072,0014);US;Number of Priors Referenced
(0072,0020);SQ;Image Sets Sequence
(0072,0022);SQ;Image Set Selector Sequence
(0072,0024);CS;Image Set Selector Usage Flag
(0072,0026);AT;Selector Attribute
(0072,0028);US;Selector Value Number
(0072,0030);SQ;Time Based Image Sets Sequence
(0072,0032);US;Image Set Number
(0072,0034);CS;Image Set Selector Category
(0072,0038);US;Relative Time
(0072,003A);CS;Relative Time Units
(0072,003C);SS;Abstract Prior Value
(0072,003E);SQ;Abstract Prior Code Sequence
(0072,0040);LO;Image Set Label
(0072,0050);CS;Selector Attribute VR
(0072,0052);AT;Selector Sequence Pointer
(0072,0054);LO;Selector Sequence Pointer Private Creator
(0072,0056);LO;Selector Attribute Private Creator
(0072,005E);AE;Selector AE Value
(0072,005F);AS;Selector AS Value
(0072,0060);AT;Selector AT Value
(0072,0061);DA;Selector DA Value
(0072,0062);CS;Selector CS Value
(0072,0063);DT;Selector DT Value
(0072,0064);IS;Selector IS Value
(0072,0065);OB;Selector OB Value
(0072,0066);LO;Selector LO Value
(0072,0067);OF;Selector OF Value
(0072,0068);LT;Selector LT Value
(0072,0069);OW;Selector OW Value
(0072,006A);PN;Selector PN Value
(0072,006B);TM;Selector TM Value
(0072,006C);SH;Selector SH Value
(0072,006D);UN;Selector UN Value
(0072,006E);ST;Selector ST Value
(0072,006F);UC;Selector UC Value
(0072,0070);UT;Selector UT Value
(0072,0071);UR;Selector UR Value
(0072,0072);DS;Selector DS Value
(0072,0073);OD;Selector OD Value
(0072,0074);FD;Selector FD Value
(0072,0075);OL;Selector OL Value
(0072,0076);FL;Selector FL Value
(0072,0078);UL;Selector UL Value
(0072,007A);US;Selector US Value
(0072,007C);SL;Selector SL Value
(0072,007E);SS;Selector SS Value
(0072,007F);UI;Selector UI Value
(0072,0080);SQ;Selector Code Sequence Value
(0072,0100);US;Number of Screens
(0072,0102);SQ;Nominal Screen Definition Sequence
(0072,0104);US;Number of Vertical Pixels
(0072,0106);US;Number of Horizontal Pixels
(0072,0108);FD;Display Environment Spatial Position
(0072,010A);US;Screen Minimum Grayscale Bit Depth
(0072,010C);US;Screen Minimum Color Bit Depth
(0072,010E);US;Application Maximum Repaint Time
(0072,0200);SQ;Display Sets Sequence
(0072,0202);US;Display Set Number
(0072,0203);LO;Display Set Label
(0072,0204);US;Display Set Presentation Group
(0072,0206);LO;Display Set Presentation Group Description
(0072,0208);CS;Partial Data Display Handling
(0072,0210);SQ;Synchronized Scrolling Sequence
(0072,0212);US;Display Set Scrolling Group
(0072,0214);SQ;Navigation Indicator Sequence
(0072,0216);US;Navigation Display Set
(0072,0218);US;Reference Display Sets
(0072,0300);SQ;Image Boxes Sequence
(0072,0302);US;Image Box Number
(0072,0304);CS;Image Box Layout Type
(0072,0306);US;Image Box Tile Horizontal Dimension
(0072,0308);US;Image Box Tile Vertical Dimension
(0072,0310);CS;Image Box Scroll Direction
(0072,0312);CS;Image Box Small Scroll Type
(0072,0314);US;Image Box Small Scroll Amount
(0072,0316);CS;Image Box Large Scroll Type
(0072,0318);US;Image Box Large Scroll Amount
(0072,0320);US;Image Box Overlap Priority
(0072,0330);FD;Cine Relative to Real-Time
(0072,0400);SQ;Filter Operations Sequence
(0072,0402);CS;Filter-by Category
(0072,0404);CS;Filter-by Attribute Presence
(0072,0406);CS;Filter-by Operator
(0072,0420);US;Structured Display Background CIELab Value
(0072,0421);US;Empty Image Box CIELab Value
(0072,0422);SQ;Structured Display Image Box Sequence
(0072,0424);SQ;Structured Display Text Box Sequence
(0072,0427);SQ;Referenced First Frame Sequence
(0072,0430);SQ;Image Box Synchronization Sequence
(0072,0432);US;Synchronized Image Box List
(0072,0434);CS;Type of Synchronization
(0072,0500);CS;Blending Operation Type
(0072,0510);CS;Reformatting Operation Type
(0072,0512);FD;Reformatting Thickness
(0072,0514);FD;Reformatting Interval
(0072,0516);CS;Reformatting Operation Initial View Direction
(0072,0520);CS;3D Rendering Type
(0072,0600);SQ;Sorting Operations Sequence
(0072,0602);CS;Sort-by Category
(0072,0604);CS;Sorting Direction
(0072,0700);CS;Display Set Patient Orientation
(0072,0702);CS;VOI Type
(0072,0704);CS;Pseudo-Color Type
(0072,0705);SQ;Pseudo-Color Palette Instance Reference Sequence
(0072,0706);CS;Show Grayscale Inverted
(0072,0710);CS;Show Image True Size Flag
(0072,0712);CS;Show Graphic Annotation Flag
(0072,0714);CS;Show Patient Demographics Flag
(0072,0716);CS;Show Acquisition Techniques Flag
(0072,0717);CS;Display Set Horizontal Justification
(0072,0718);CS;Display Set Vertical Justification
(0074,0120);FD;Continuation Start Meterset
(0074,0121);FD;Continuation End Meterset
(0074,1000);CS;Procedure Step State
(0074,1002);SQ;Procedure Step Progress Information Sequence
(0074,1004);DS;Procedure Step Progress
(0074,1006);ST;Procedure Step Progress Description
(0074,1008);SQ;Procedure Step Communications URI Sequence
(0074,100A);UR;Contact URI
(0074,100C);LO;Contact Display Name
(0074,100E);SQ;Procedure Step Discontinuation Reason Code Sequence
(0074,1020);SQ;Beam Task Sequence
(0074,1022);CS;Beam Task Type
(0074,1024);IS;Beam Order Index (Trial)
(0074,1025);CS;Autosequence Flag
(0074,1026);FD;Table Top Vertical Adjusted Position
(0074,1027);FD;Table Top Longitudinal Adjusted Position
(0074,1028);FD;Table Top Lateral Adjusted Position
(0074,102A);FD;Patient Support Adjusted Angle
(0074,102B);FD;Table Top Eccentric Adjusted Angle
(0074,102C);FD;Table Top Pitch Adjusted Angle
(0074,102D);FD;Table Top Roll Adjusted Angle
(0074,1030);SQ;Delivery Verification Image Sequence
(0074,1032);CS;Verification Image Timing
(0074,1034);CS;Double Exposure Flag
(0074,1036);CS;Double Exposure Ordering
(0074,1038);DS;Double Exposure Meterset (Trial)
(0074,103A);DS;Double Exposure Field Delta (Trial)
(0074,1040);SQ;Related Reference RT Image Sequence
(0074,1042);SQ;General Machine Verification Sequence
(0074,1044);SQ;Conventional Machine Verification Sequence
(0074,1046);SQ;Ion Machine Verification Sequence
(0074,1048);SQ;Failed Attributes Sequence
(0074,104A);SQ;Overridden Attributes Sequence
(0074,104C);SQ;Conventional Control Point Verification Sequence
(0074,104E);SQ;Ion Control Point Verification Sequence
(0074,1050);SQ;Attribute Occurrence Sequence
(0074,1052);AT;Attribute Occurrence Pointer
(0074,1054);UL;Attribute Item Selector
(0074,1056);LO;Attribute Occurrence Private Creator
(0074,1057);IS;Selector Sequence Pointer Items
(0074,1200);CS;Scheduled Procedure Step Priority
(0074,1202);LO;Worklist Label
(0074,1204);LO;Procedure Step Label
(0074,1210);SQ;Scheduled Processing Parameters Sequence
(0074,1212);SQ;Performed Processing Parameters Sequence
(0074,1216);SQ;Unified Procedure Step Performed Procedure Sequence
(0074,1220);SQ;Related Procedure Step Sequence
(0074,1222);LO;Procedure Step Relationship Type
(0074,1224);SQ;Replaced Procedure Step Sequence
(0074,1230);LO;Deletion Lock
(0074,1234);AE;Receiving AE
(0074,1236);AE;Requesting AE
(0074,1238);LT;Reason for Cancellation
(0074,1242);CS;SCP Status
(0074,1244);CS;Subscription List Status
(0074,1246);CS;Unified Procedure Step List Status
(0074,1324);UL;Beam Order Index
(0074,1338);FD;Double Exposure Meterset
(0074,133A);FD;Double Exposure Field Delta
(0074,1401);SQ;Brachy Task Sequence
(0074,1402);DS;Continuation Start Total Reference Air Kerma
(0074,1403);DS;Continuation End Total Reference Air Kerma
(0074,1404);IS;Continuation Pulse Number
(0074,1405);SQ;Channel Delivery Order Sequence
(0074,1406);IS;Referenced Channel Number
(0074,1407);DS;Start Cumulative Time Weight
(0074,1408);DS;End Cumulative Time Weight
(0074,1409);SQ;Omitted Channel Sequence
(0074,140A);CS;Reason for Channel Omission
(0074,140B);LO;Reason for Channel Omission Description
(0074,140C);IS;Channel Delivery Order Index
(0074,140D);SQ;Channel Delivery Continuation Sequence
(0074,140E);SQ;Omitted Application Setup Sequence
(0076,0001);LO;Implant Assembly Template Name
(0076,0003);LO;Implant Assembly Template Issuer
(0076,0006);LO;Implant Assembly Template Version
(0076,0008);SQ;Replaced Implant Assembly Template Sequence
(0076,000A);CS;Implant Assembly Template Type
(0076,000C);SQ;Original Implant Assembly Template Sequence
(0076,000E);SQ;Derivation Implant Assembly Template Sequence
(0076,0010);SQ;Implant Assembly Template Target Anatomy Sequence
(0076,0020);SQ;Procedure Type Code Sequence
(0076,0030);LO;Surgical Technique
(0076,0032);SQ;Component Types Sequence
(0076,0034);CS;Component Type Code Sequence
(0076,0036);CS;Exclusive Component Type
(0076,0038);CS;Mandatory Component Type
(0076,0040);SQ;Component Sequence
(0076,0055);US;Component ID
(0076,0060);SQ;Component Assembly Sequence
(0076,0070);US;Component 1 Referenced ID
(0076,0080);US;Component 1 Referenced Mating Feature Set ID
(0076,0090);US;Component 1 Referenced Mating Feature ID
(0076,00A0);US;Component 2 Referenced ID
(0076,00B0);US;Component 2 Referenced Mating Feature Set ID
(0076,00C0);US;Component 2 Referenced Mating Feature ID
(0078,0001);LO;Implant Template Group Name
(0078,0010);ST;Implant Template Group Description
(0078,0020);LO;Implant Template Group Issuer
(0078,0024);LO;Implant Template Group Version
(0078,0026);SQ;Replaced Implant Template Group Sequence
(0078,0028);SQ;Implant Template Group Target Anatomy Sequence
(0078,002A);SQ;Implant Template Group Members Sequence
(0078,002E);US;Implant Template Group Member ID
(0078,0050);FD;3D Implant Template Group Member Matching Point
(0078,0060);FD;3D Implant Template Group Member Matching Axes
(0078,0070);SQ;Implant Template Group Member Matching 2D Coordinates Sequence
(0078,0090);FD;2D Implant Template Group Member Matching Point
(0078,00A0);FD;2D Implant Template Group Member Matching Axes
(0078,00B0);SQ;Implant Template Group Variation Dimension Sequence
(0078,00B2);LO;Implant Template Group Variation Dimension Name
(0078,00B4);SQ;Implant Template Group Variation Dimension Rank Sequence
(0078,00B6);US;Referenced Implant Template Group Member ID
(0078,00B8);US;Implant Template Group Variation Dimension Rank
(0080,0001);SQ;Surface Scan Acquisition Type Code Sequence
(0080,0002);SQ;Surface Scan Mode Code Sequence
(0080,0003);SQ;Registration Method Code Sequence
(0080,0004);FD;Shot Duration Time
(0080,0005);FD;Shot Offset Time
(0080,0006);US;Surface Point Presentation Value Data
(0080,0007);US;Surface Point Color CIELab Value Data
(0080,0008);SQ;UV Mapping Sequence
(0080,0009);SH;Texture Label
(0080,0010);OF;U Value Data
(0080,0011);OF;V Value Data
(0080,0012);SQ;Referenced Texture Sequence
(0080,0013);SQ;Referenced Surface Data Sequence
(0082,0001);CS;Assessment Summary
(0082,0003);UT;Assessment Summary Description
(0082,0004);SQ;Assessed SOP Instance Sequence
(0082,0005);SQ;Referenced Comparison SOP Instance Sequence
(0082,0006);UL;Number of Assessment Observations
(0082,0007);SQ;Assessment Observations Sequence
(0082,0008);CS;Observation Significance
(0082,000A);UT;Observation Description
(0082,000C);SQ;Structured Constraint Observation Sequence
(0082,0010);SQ;Assessed Attribute Value Sequence
(0082,0016);LO;Assessment Set ID
(0082,0017);SQ;Assessment Requester Sequence
(0082,0018);LO;Selector Attribute Name
(0082,0019);LO;Selector Attribute Keyword
(0082,0021);SQ;Assessment Type Code Sequence
(0082,0022);SQ;Observation Basis Code Sequence
(0082,0023);LO;Assessment Label
(0082,0032);CS;Constraint Type
(0082,0033);UT;Specification Selection Guidance
(0082,0034);SQ;Constraint Value Sequence
(0082,0035);SQ;Recommended Default Value Sequence
(0082,0036);CS;Constraint Violation Significance
(0082,0037);UT;Constraint Violation Condition
(0088,0130);SH;Storage Media File-set ID
(0088,0140);UI;Storage Media File-set UID
(0088,0200);SQ;Icon Image Sequence
(0088,0904);LO;Topic Title
(0088,0906);ST;Topic Subject
(0088,0910);LO;Topic Author
(0088,0912);LO;Topic Keywords
(0100,0410);CS;SOP Instance Status
(0100,0420);DT;SOP Authorization DateTime
(0100,0424);LT;SOP Authorization Comment
(0100,0426);LO;Authorization Equipment Certification Number
(0400,0005);US;MAC ID Number
(0400,0010);UI;MAC Calculation Transfer Syntax UID
(0400,0015);CS;MAC Algorithm
(0400,0020);AT;Data Elements Signed
(0400,0100);UI;Digital Signature UID
(0400,0105);DT;Digital Signature DateTime
(0400,0110);CS;Certificate Type
(0400,0115);OB;Certificate of Signer
(0400,0120);OB;Signature
(0400,0305);CS;Certified Timestamp Type
(0400,0310);OB;Certified Timestamp
(0400,0315);FL;
(0400,0401);SQ;Digital Signature Purpose Code Sequence
(0400,0402);SQ;Referenced Digital Signature Sequence
(0400,0403);SQ;Referenced SOP Instance MAC Sequence
(0400,0404);OB;MAC
(0400,0500);SQ;Encrypted Attributes Sequence
(0400,0510);UI;Encrypted Content Transfer Syntax UID
(0400,0520);OB;Encrypted Content
(0400,0550);SQ;Modified Attributes Sequence
(0400,0561);SQ;Original Attributes Sequence
(0400,0562);DT;Attribute Modification DateTime
(0400,0563);LO;Modifying System
(0400,0564);LO;Source of Previous Values
(0400,0565);CS;Reason for the Attribute Modification
(1000,xxx0);US;Escape Triplet
(1000,xxx1);US;Run Length Triplet
(1000,xxx2);US;Huffman Table Size
(1000,xxx3);US;Huffman Table Triplet
(1000,xxx4);US;Shift Table Size
(1000,xxx5);US;Shift Table Triplet
(1010,xxxx);US;Zonal Map
(2000,0010);IS;Number of Copies
(2000,001E);SQ;Printer Configuration Sequence
(2000,0020);CS;Print Priority
(2000,0030);CS;Medium Type
(2000,0040);CS;Film Destination
(2000,0050);LO;Film Session Label
(2000,0060);IS;Memory Allocation
(2000,0061);IS;Maximum Memory Allocation
(2000,0062);CS;Color Image Printing Flag
(2000,0063);CS;Collation Flag
(2000,0065);CS;Annotation Flag
(2000,0067);CS;Image Overlay Flag
(2000,0069);CS;Presentation LUT Flag
(2000,006A);CS;Image Box Presentation LUT Flag
(2000,00A0);US;Memory Bit Depth
(2000,00A1);US;Printing Bit Depth
(2000,00A2);SQ;Media Installed Sequence
(2000,00A4);SQ;Other Media Available Sequence
(2000,00A8);SQ;Supported Image Display Formats Sequence
(2000,0500);SQ;Referenced Film Box Sequence
(2000,0510);SQ;Referenced Stored Print Sequence
(2010,0010);ST;Image Display Format
(2010,0030);CS;Annotation Display Format ID
(2010,0040);CS;Film Orientation
(2010,0050);CS;Film Size ID
(2010,0052);CS;Printer Resolution ID
(2010,0054);CS;Default Printer Resolution ID
(2010,0060);CS;Magnification Type
(2010,0080);CS;Smoothing Type
(2010,00A6);CS;Default Magnification Type
(2010,00A7);CS;Other Magnification Types Available
(2010,00A8);CS;Default Smoothing Type
(2010,00A9);CS;Other Smoothing Types Available
(2010,0100);CS;Border Density
(2010,0110);CS;Empty Image Density
(2010,0120);US;Min Density
(2010,0130);US;Max Density
(2010,0140);CS;Trim
(2010,0150);ST;Configuration Information
(2010,0152);LT;Configuration Information Description
(2010,0154);IS;Maximum Collated Films
(2010,015E);US;Illumination
(2010,0160);US;Reflected Ambient Light
(2010,0376);DS;Printer Pixel Spacing
(2010,0500);SQ;Referenced Film Session Sequence
(2010,0510);SQ;Referenced Image Box Sequence
(2010,0520);SQ;Referenced Basic Annotation Box Sequence
(2020,0010);US;Image Box Position
(2020,0020);CS;Polarity
(2020,0030);DS;Requested Image Size
(2020,0040);CS;Requested Decimate/Crop Behavior
(2020,0050);CS;Requested Resolution ID
(2020,00A0);CS;Requested Image Size Flag
(2020,00A2);CS;Decimate/Crop Result
(2020,0110);SQ;Basic Grayscale Image Sequence
(2020,0111);SQ;Basic Color Image Sequence
(2020,0130);SQ;Referenced Image Overlay Box Sequence
(2020,0140);SQ;Referenced VOI LUT Box Sequence
(2030,0010);US;Annotation Position
(2030,0020);LO;Text String
(2040,0010);SQ;Referenced Overlay Plane Sequence
(2040,0011);US;Referenced Overlay Plane Groups
(2040,0020);SQ;Overlay Pixel Data Sequence
(2040,0060);CS;Overlay Magnification Type
(2040,0070);CS;Overlay Smoothing Type
(2040,0072);CS;Overlay or Image Magnification
(2040,0074);US;Magnify to Number of Columns
(2040,0080);CS;Overlay Foreground Density
(2040,0082);CS;Overlay Background Density
(2040,0090);CS;Overlay Mode
(2040,0100);CS;Threshold Density
(2040,0500);SQ;Referenced Image Box Sequence (Retired)
(2050,0010);SQ;Presentation LUT Sequence
(2050,0020);CS;Presentation LUT Shape
(2050,0500);SQ;Referenced Presentation LUT Sequence
(2100,0010);SH;Print Job ID
(2100,0020);CS;Execution Status
(2100,0030);CS;Execution Status Info
(2100,0040);DA;Creation Date
(2100,0050);TM;Creation Time
(2100,0070);AE;Originator
(2100,0140);AE;Destination AE
(2100,0160);SH;Owner ID
(2100,0170);IS;Number of Films
(2100,0500);SQ;Referenced Print Job Sequence (Pull Stored Print)
(2110,0010);CS;Printer Status
(2110,0020);CS;Printer Status Info
(2110,0030);LO;Printer Name
(2110,0099);SH;Print Queue ID
(2120,0010);CS;Queue Status
(2120,0050);SQ;Print Job Description Sequence
(2120,0070);SQ;Referenced Print Job Sequence
(2130,0010);SQ;Print Management Capabilities Sequence
(2130,0015);SQ;Printer Characteristics Sequence
(2130,0030);SQ;Film Box Content Sequence
(2130,0040);SQ;Image Box Content Sequence
(2130,0050);SQ;Annotation Content Sequence
(2130,0060);SQ;Image Overlay Box Content Sequence
(2130,0080);SQ;Presentation LUT Content Sequence
(2130,00A0);SQ;Proposed Study Sequence
(2130,00C0);SQ;Original Image Sequence
(2200,0001);CS;Label Using Information Extracted From Instances
(2200,0002);UT;Label Text
(2200,0003);CS;Label Style Selection
(2200,0004);LT;Media Disposition
(2200,0005);LT;Barcode Value
(2200,0006);CS;Barcode Symbology
(2200,0007);CS;Allow Media Splitting
(2200,0008);CS;Include Non-DICOM Objects
(2200,0009);CS;Include Display Application
(2200,000A);CS;Preserve Composite Instances After Media Creation
(2200,000B);US;Total Number of Pieces of Media Created
(2200,000C);LO;Requested Media Application Profile
(2200,000D);SQ;Referenced Storage Media Sequence
(2200,000E);AT;Failure Attributes
(2200,000F);CS;Allow Lossy Compression
(2200,0020);CS;Request Priority
(3002,0002);SH;RT Image Label
(3002,0003);LO;RT Image Name
(3002,0004);ST;RT Image Description
(3002,000A);CS;Reported Values Origin
(3002,000C);CS;RT Image Plane
(3002,000D);DS;X-Ray Image Receptor Translation
(3002,000E);DS;X-Ray Image Receptor Angle
(3002,0010);DS;RT Image Orientation
(3002,0011);DS;Image Plane Pixel Spacing
(3002,0012);DS;RT Image Position
(3002,0020);SH;Radiation Machine Name
(3002,0022);DS;Radiation Machine SAD
(3002,0024);DS;Radiation Machine SSD
(3002,0026);DS;RT Image SID
(3002,0028);DS;Source to Reference Object Distance
(3002,0029);IS;Fraction Number
(3002,0030);SQ;Exposure Sequence
(3002,0032);DS;Meterset Exposure
(3002,0034);DS;Diaphragm Position
(3002,0040);SQ;Fluence Map Sequence
(3002,0041);CS;Fluence Data Source
(3002,0042);DS;Fluence Data Scale
(3002,0050);SQ;Primary Fluence Mode Sequence
(3002,0051);CS;Fluence Mode
(3002,0052);SH;Fluence Mode ID
(3004,0001);CS;DVH Type
(3004,0002);CS;Dose Units
(3004,0004);CS;Dose Type
(3004,0005);CS;Spatial Transform of Dose
(3004,0006);LO;Dose Comment
(3004,0008);DS;Normalization Point
(3004,000A);CS;Dose Summation Type
(3004,000C);DS;Grid Frame Offset Vector
(3004,000E);DS;Dose Grid Scaling
(3004,0010);SQ;RT Dose ROI Sequence
(3004,0012);DS;Dose Value
(3004,0014);CS;Tissue Heterogeneity Correction
(3004,0040);DS;DVH Normalization Point
(3004,0042);DS;DVH Normalization Dose Value
(3004,0050);SQ;DVH Sequence
(3004,0052);DS;DVH Dose Scaling
(3004,0054);CS;DVH Volume Units
(3004,0056);IS;DVH Number of Bins
(3004,0058);DS;DVH Data
(3004,0060);SQ;DVH Referenced ROI Sequence
(3004,0062);CS;DVH ROI Contribution Type
(3004,0070);DS;DVH Minimum Dose
(3004,0072);DS;DVH Maximum Dose
(3004,0074);DS;DVH Mean Dose
(3006,0002);SH;Structure Set Label
(3006,0004);LO;Structure Set Name
(3006,0006);ST;Structure Set Description
(3006,0008);DA;Structure Set Date
(3006,0009);TM;Structure Set Time
(3006,0010);SQ;Referenced Frame of Reference Sequence
(3006,0012);SQ;RT Referenced Study Sequence
(3006,0014);SQ;RT Referenced Series Sequence
(3006,0016);SQ;Contour Image Sequence
(3006,0018);SQ;Predecessor Structure Set Sequence
(3006,0020);SQ;Structure Set ROI Sequence
(3006,0022);IS;ROI Number
(3006,0024);UI;Referenced Frame of Reference UID
(3006,0026);LO;ROI Name
(3006,0028);ST;ROI Description
(3006,002A);IS;ROI Display Color
(3006,002C);DS;ROI Volume
(3006,0030);SQ;RT Related ROI Sequence
(3006,0033);CS;RT ROI Relationship
(3006,0036);CS;ROI Generation Algorithm
(3006,0038);LO;ROI Generation Description
(3006,0039);SQ;ROI Contour Sequence
(3006,0040);SQ;Contour Sequence
(3006,0042);CS;Contour Geometric Type
(3006,0044);DS;Contour Slab Thickness
(3006,0045);DS;Contour Offset Vector
(3006,0046);IS;Number of Contour Points
(3006,0048);IS;Contour Number
(3006,0049);IS;Attached Contours
(3006,0050);DS;Contour Data
(3006,0080);SQ;RT ROI Observations Sequence
(3006,0082);IS;Observation Number
(3006,0084);IS;Referenced ROI Number
(3006,0085);SH;ROI Observation Label
(3006,0086);SQ;RT ROI Identification Code Sequence
(3006,0088);ST;ROI Observation Description
(3006,00A0);SQ;Related RT ROI Observations Sequence
(3006,00A4);CS;RT ROI Interpreted Type
(3006,00A6);PN;ROI Interpreter
(3006,00B0);SQ;ROI Physical Properties Sequence
(3006,00B2);CS;ROI Physical Property
(3006,00B4);DS;ROI Physical Property Value
(3006,00B6);SQ;ROI Elemental Composition Sequence
(3006,00B7);US;ROI Elemental Composition Atomic Number
(3006,00B8);FL;ROI Elemental Composition Atomic Mass Fraction
(3006,00B9);SQ;Additional RT ROI Identification Code Sequence
(3006,00C0);SQ;Frame of Reference Relationship Sequence
(3006,00C2);UI;Related Frame of Reference UID
(3006,00C4);CS;Frame of Reference Transformation Type
(3006,00C6);DS;Frame of Reference Transformation Matrix
(3006,00C8);LO;Frame of Reference Transformation Comment
(3008,0010);SQ;Measured Dose Reference Sequence
(3008,0012);ST;Measured Dose Description
(3008,0014);CS;Measured Dose Type
(3008,0016);DS;Measured Dose Value
(3008,0020);SQ;Treatment Session Beam Sequence
(3008,0021);SQ;Treatment Session Ion Beam Sequence
(3008,0022);IS;Current Fraction Number
(3008,0024);DA;Treatment Control Point Date
(3008,0025);TM;Treatment Control Point Time
(3008,002A);CS;Treatment Termination Status
(3008,002B);SH;Treatment Termination Code
(3008,002C);CS;Treatment Verification Status
(3008,0030);SQ;Referenced Treatment Record Sequence
(3008,0032);DS;Specified Primary Meterset
(3008,0033);DS;Specified Secondary Meterset
(3008,0036);DS;Delivered Primary Meterset
(3008,0037);DS;Delivered Secondary Meterset
(3008,003A);DS;Specified Treatment Time
(3008,003B);DS;Delivered Treatment Time
(3008,0040);SQ;Control Point Delivery Sequence
(3008,0041);SQ;Ion Control Point Delivery Sequence
(3008,0042);DS;Specified Meterset
(3008,0044);DS;Delivered Meterset
(3008,0045);FL;Meterset Rate Set
(3008,0046);FL;Meterset Rate Delivered
(3008,0047);FL;Scan Spot Metersets Delivered
(3008,0048);DS;Dose Rate Delivered
(3008,0050);SQ;Treatment Summary Calculated Dose Reference Sequence
(3008,0052);DS;Cumulative Dose to Dose Reference
(3008,0054);DA;First Treatment Date
(3008,0056);DA;Most Recent Treatment Date
(3008,005A);IS;Number of Fractions Delivered
(3008,0060);SQ;Override Sequence
(3008,0061);AT;Parameter Sequence Pointer
(3008,0062);AT;Override Parameter Pointer
(3008,0063);IS;Parameter Item Index
(3008,0064);IS;Measured Dose Reference Number
(3008,0065);AT;Parameter Pointer
(3008,0066);ST;Override Reason
(3008,0068);SQ;Corrected Parameter Sequence
(3008,006A);FL;Correction Value
(3008,0070);SQ;Calculated Dose Reference Sequence
(3008,0072);IS;Calculated Dose Reference Number
(3008,0074);ST;Calculated Dose Reference Description
(3008,0076);DS;Calculated Dose Reference Dose Value
(3008,0078);DS;Start Meterset
(3008,007A);DS;End Meterset
(3008,0080);SQ;Referenced Measured Dose Reference Sequence
(3008,0082);IS;Referenced Measured Dose Reference Number
(3008,0090);SQ;Referenced Calculated Dose Reference Sequence
(3008,0092);IS;Referenced Calculated Dose Reference Number
(3008,00A0);SQ;Beam Limiting Device Leaf Pairs Sequence
(3008,00B0);SQ;Recorded Wedge Sequence
(3008,00C0);SQ;Recorded Compensator Sequence
(3008,00D0);SQ;Recorded Block Sequence
(3008,00E0);SQ;Treatment Summary Measured Dose Reference Sequence
(3008,00F0);SQ;Recorded Snout Sequence
(3008,00F2);SQ;Recorded Range Shifter Sequence
(3008,00F4);SQ;Recorded Lateral Spreading Device Sequence
(3008,00F6);SQ;Recorded Range Modulator Sequence
(3008,0100);SQ;Recorded Source Sequence
(3008,0105);LO;Source Serial Number
(3008,0110);SQ;Treatment Session Application Setup Sequence
(3008,0116);CS;Application Setup Check
(3008,0120);SQ;Recorded Brachy Accessory Device Sequence
(3008,0122);IS;Referenced Brachy Accessory Device Number
(3008,0130);SQ;Recorded Channel Sequence
(3008,0132);DS;Specified Channel Total Time
(3008,0134);DS;Delivered Channel Total Time
(3008,0136);IS;Specified Number of Pulses
(3008,0138);IS;Delivered Number of Pulses
(3008,013A);DS;Specified Pulse Repetition Interval
(3008,013C);DS;Delivered Pulse Repetition Interval
(3008,0140);SQ;Recorded Source Applicator Sequence
(3008,0142);IS;Referenced Source Applicator Number
(3008,0150);SQ;Recorded Channel Shield Sequence
(3008,0152);IS;Referenced Channel Shield Number
(3008,0160);SQ;Brachy Control Point Delivered Sequence
(3008,0162);DA;Safe Position Exit Date
(3008,0164);TM;Safe Position Exit Time
(3008,0166);DA;Safe Position Return Date
(3008,0168);TM;Safe Position Return Time
(3008,0171);SQ;Pulse Specific Brachy Control Point Delivered Sequence
(3008,0172);US;Pulse Number
(3008,0173);SQ;Brachy Pulse Control Point Delivered Sequence
(3008,0200);CS;Current Treatment Status
(3008,0202);ST;Treatment Status Comment
(3008,0220);SQ;Fraction Group Summary Sequence
(3008,0223);IS;Referenced Fraction Number
(3008,0224);CS;Fraction Group Type
(3008,0230);CS;Beam Stopper Position
(3008,0240);SQ;Fraction Status Summary Sequence
(3008,0250);DA;Treatment Date
(3008,0251);TM;Treatment Time
(300A,0002);SH;RT Plan Label
(300A,0003);LO;RT Plan Name
(300A,0004);ST;RT Plan Description
(300A,0006);DA;RT Plan Date
(300A,0007);TM;RT Plan Time
(300A,0009);LO;Treatment Protocols
(300A,000A);CS;Plan Intent
(300A,000B);LO;Treatment Sites
(300A,000C);CS;RT Plan Geometry
(300A,000E);ST;Prescription Description
(300A,0010);SQ;Dose Reference Sequence
(300A,0012);IS;Dose Reference Number
(300A,0013);UI;Dose Reference UID
(300A,0014);CS;Dose Reference Structure Type
(300A,0015);CS;Nominal Beam Energy Unit
(300A,0016);LO;Dose Reference Description
(300A,0018);DS;Dose Reference Point Coordinates
(300A,001A);DS;Nominal Prior Dose
(300A,0020);CS;Dose Reference Type
(300A,0021);DS;Constraint Weight
(300A,0022);DS;Delivery Warning Dose
(300A,0023);DS;Delivery Maximum Dose
(300A,0025);DS;Target Minimum Dose
(300A,0026);DS;Target Prescription Dose
(300A,0027);DS;Target Maximum Dose
(300A,0028);DS;Target Underdose Volume Fraction
(300A,002A);DS;Organ at Risk Full-volume Dose
(300A,002B);DS;Organ at Risk Limit Dose
(300A,002C);DS;Organ at Risk Maximum Dose
(300A,002D);DS;Organ at Risk Overdose Volume Fraction
(300A,0040);SQ;Tolerance Table Sequence
(300A,0042);IS;Tolerance Table Number
(300A,0043);SH;Tolerance Table Label
(300A,0044);DS;Gantry Angle Tolerance
(300A,0046);DS;Beam Limiting Device Angle Tolerance
(300A,0048);SQ;Beam Limiting Device Tolerance Sequence
(300A,004A);DS;Beam Limiting Device Position Tolerance
(300A,004B);FL;Snout Position Tolerance
(300A,004C);DS;Patient Support Angle Tolerance
(300A,004E);DS;Table Top Eccentric Angle Tolerance
(300A,004F);FL;Table Top Pitch Angle Tolerance
(300A,0050);FL;Table Top Roll Angle Tolerance
(300A,0051);DS;Table Top Vertical Position Tolerance
(300A,0052);DS;Table Top Longitudinal Position Tolerance
(300A,0053);DS;Table Top Lateral Position Tolerance
(300A,0055);CS;RT Plan Relationship
(300A,0070);SQ;Fraction Group Sequence
(300A,0071);IS;Fraction Group Number
(300A,0072);LO;Fraction Group Description
(300A,0078);IS;Number of Fractions Planned
(300A,0079);IS;Number of Fraction Pattern Digits Per Day
(300A,007A);IS;Repeat Fraction Cycle Length
(300A,007B);LT;Fraction Pattern
(300A,0080);IS;Number of Beams
(300A,0082);DS;Beam Dose Specification Point
(300A,0084);DS;Beam Dose
(300A,0086);DS;Beam Meterset
(300A,0088);FL;Beam Dose Point Depth
(300A,0089);FL;Beam Dose Point Equivalent Depth
(300A,008A);FL;Beam Dose Point SSD
(300A,008B);CS;Beam Dose Meaning
(300A,008C);SQ;Beam Dose Verification Control Point Sequence
(300A,008D);FL;Average Beam Dose Point Depth
(300A,008E);FL;Average Beam Dose Point Equivalent Depth
(300A,008F);FL;Average Beam Dose Point SSD
(300A,0090);CS;Beam Dose Type
(300A,0091);DS;Alternate Beam Dose
(300A,0092);CS;Alternate Beam Dose Type
(300A,00A0);IS;Number of Brachy Application Setups
(300A,00A2);DS;Brachy Application Setup Dose Specification Point
(300A,00A4);DS;Brachy Application Setup Dose
(300A,00B0);SQ;Beam Sequence
(300A,00B2);SH;Treatment Machine Name
(300A,00B3);CS;Primary Dosimeter Unit
(300A,00B4);DS;Source-Axis Distance
(300A,00B6);SQ;Beam Limiting Device Sequence
(300A,00B8);CS;RT Beam Limiting Device Type
(300A,00BA);DS;Source to Beam Limiting Device Distance
(300A,00BB);FL;Isocenter to Beam Limiting Device Distance
(300A,00BC);IS;Number of Leaf/Jaw Pairs
(300A,00BE);DS;Leaf Position Boundaries
(300A,00C0);IS;Beam Number
(300A,00C2);LO;Beam Name
(300A,00C3);ST;Beam Description
(300A,00C4);CS;Beam Type
(300A,00C5);FD;Beam Delivery Duration Limit
(300A,00C6);CS;Radiation Type
(300A,00C7);CS;High-Dose Technique Type
(300A,00C8);IS;Reference Image Number
(300A,00CA);SQ;Planned Verification Image Sequence
(300A,00CC);LO;Imaging Device-Specific Acquisition Parameters
(300A,00CE);CS;Treatment Delivery Type
(300A,00D0);IS;Number of Wedges
(300A,00D1);SQ;Wedge Sequence
(300A,00D2);IS;Wedge Number
(300A,00D3);CS;Wedge Type
(300A,00D4);SH;Wedge ID
(300A,00D5);IS;Wedge Angle
(300A,00D6);DS;Wedge Factor
(300A,00D7);FL;Total Wedge Tray Water-Equivalent Thickness
(300A,00D8);DS;Wedge Orientation
(300A,00D9);FL;Isocenter to Wedge Tray Distance
(300A,00DA);DS;Source to Wedge Tray Distance
(300A,00DB);FL;Wedge Thin Edge Position
(300A,00DC);SH;Bolus ID
(300A,00DD);ST;Bolus Description
(300A,00DE);DS;Effective Wedge Angle
(300A,00E0);IS;Number of Compensators
(300A,00E1);SH;Material ID
(300A,00E2);DS;Total Compensator Tray Factor
(300A,00E3);SQ;Compensator Sequence
(300A,00E4);IS;Compensator Number
(300A,00E5);SH;Compensator ID
(300A,00E6);DS;Source to Compensator Tray Distance
(300A,00E7);IS;Compensator Rows
(300A,00E8);IS;Compensator Columns
(300A,00E9);DS;Compensator Pixel Spacing
(300A,00EA);DS;Compensator Position
(300A,00EB);DS;Compensator Transmission Data
(300A,00EC);DS;Compensator Thickness Data
(300A,00ED);IS;Number of Boli
(300A,00EE);CS;Compensator Type
(300A,00EF);SH;Compensator Tray ID
(300A,00F0);IS;Number of Blocks
(300A,00F2);DS;Total Block Tray Factor
(300A,00F3);FL;Total Block Tray Water-Equivalent Thickness
(300A,00F4);SQ;Block Sequence
(300A,00F5);SH;Block Tray ID
(300A,00F6);DS;Source to Block Tray Distance
(300A,00F7);FL;Isocenter to Block Tray Distance
(300A,00F8);CS;Block Type
(300A,00F9);LO;Accessory Code
(300A,00FA);CS;Block Divergence
(300A,00FB);CS;Block Mounting Position
(300A,00FC);IS;Block Number
(300A,00FE);LO;Block Name
(300A,0100);DS;Block Thickness
(300A,0102);DS;Block Transmission
(300A,0104);IS;Block Number of Points
(300A,0106);DS;Block Data
(300A,0107);SQ;Applicator Sequence
(300A,0108);SH;Applicator ID
(300A,0109);CS;Applicator Type
(300A,010A);LO;Applicator Description
(300A,010C);DS;Cumulative Dose Reference Coefficient
(300A,010E);DS;Final Cumulative Meterset Weight
(300A,0110);IS;Number of Control Points
(300A,0111);SQ;Control Point Sequence
(300A,0112);IS;Control Point Index
(300A,0114);DS;Nominal Beam Energy
(300A,0115);DS;Dose Rate Set
(300A,0116);SQ;Wedge Position Sequence
(300A,0118);CS;Wedge Position
(300A,011A);SQ;Beam Limiting Device Position Sequence
(300A,011C);DS;Leaf/Jaw Positions
(300A,011E);DS;Gantry Angle
(300A,011F);CS;Gantry Rotation Direction
(300A,0120);DS;Beam Limiting Device Angle
(300A,0121);CS;Beam Limiting Device Rotation Direction
(300A,0122);DS;Patient Support Angle
(300A,0123);CS;Patient Support Rotation Direction
(300A,0124);DS;Table Top Eccentric Axis Distance
(300A,0125);DS;Table Top Eccentric Angle
(300A,0126);CS;Table Top Eccentric Rotation Direction
(300A,0128);DS;Table Top Vertical Position
(300A,0129);DS;Table Top Longitudinal Position
(300A,012A);DS;Table Top Lateral Position
(300A,012C);DS;Isocenter Position
(300A,012E);DS;Surface Entry Point
(300A,0130);DS;Source to Surface Distance
(300A,0131);FL;Average Beam Dose Point Source to External Contour Distance
(300A,0132);FL;Source to External Contour Distance
(300A,0133);FL;External Contour Entry Point
(300A,0134);DS;Cumulative Meterset Weight
(300A,0140);FL;Table Top Pitch Angle
(300A,0142);CS;Table Top Pitch Rotation Direction
(300A,0144);FL;Table Top Roll Angle
(300A,0146);CS;Table Top Roll Rotation Direction
(300A,0148);FL;Head Fixation Angle
(300A,014A);FL;Gantry Pitch Angle
(300A,014C);CS;Gantry Pitch Rotation Direction
(300A,014E);FL;Gantry Pitch Angle Tolerance
(300A,0150);CS;Fixation Eye
(300A,0151);DS;Chair Head Frame Position
(300A,0152);DS;Head Fixation Angle Tolerance
(300A,0153);DS;Chair Head Frame Position Tolerance
(300A,0154);DS;Fixation Light Azimuthal Angle Tolerance
(300A,0155);DS;Fixation Light Polar Angle Tolerance
(300A,0180);SQ;Patient Setup Sequence
(300A,0182);IS;Patient Setup Number
(300A,0183);LO;Patient Setup Label
(300A,0184);LO;Patient Additional Position
(300A,0190);SQ;Fixation Device Sequence
(300A,0192);CS;Fixation Device Type
(300A,0194);SH;Fixation Device Label
(300A,0196);ST;Fixation Device Description
(300A,0198);SH;Fixation Device Position
(300A,0199);FL;Fixation Device Pitch Angle
(300A,019A);FL;Fixation Device Roll Angle
(300A,01A0);SQ;Shielding Device Sequence
(300A,01A2);CS;Shielding Device Type
(300A,01A4);SH;Shielding Device Label
(300A,01A6);ST;Shielding Device Description
(300A,01A8);SH;Shielding Device Position
(300A,01B0);CS;Setup Technique
(300A,01B2);ST;Setup Technique Description
(300A,01B4);SQ;Setup Device Sequence
(300A,01B6);CS;Setup Device Type
(300A,01B8);SH;Setup Device Label
(300A,01BA);ST;Setup Device Description
(300A,01BC);DS;Setup Device Parameter
(300A,01D0);ST;Setup Reference Description
(300A,01D2);DS;Table Top Vertical Setup Displacement
(300A,01D4);DS;Table Top Longitudinal Setup Displacement
(300A,01D6);DS;Table Top Lateral Setup Displacement
(300A,0200);CS;Brachy Treatment Technique
(300A,0202);CS;Brachy Treatment Type
(300A,0206);SQ;Treatment Machine Sequence
(300A,0210);SQ;Source Sequence
(300A,0212);IS;Source Number
(300A,0214);CS;Source Type
(300A,0216);LO;Source Manufacturer
(300A,0218);DS;Active Source Diameter
(300A,021A);DS;Active Source Length
(300A,021B);SH;Source Model ID
(300A,021C);LO;Source Description
(300A,0222);DS;Source Encapsulation Nominal Thickness
(300A,0224);DS;Source Encapsulation Nominal Transmission
(300A,0226);LO;Source Isotope Name
(300A,0228);DS;Source Isotope Half Life
(300A,0229);CS;Source Strength Units
(300A,022A);DS;Reference Air Kerma Rate
(300A,022B);DS;Source Strength
(300A,022C);DA;Source Strength Reference Date
(300A,022E);TM;Source Strength Reference Time
(300A,0230);SQ;Application Setup Sequence
(300A,0232);CS;Application Setup Type
(300A,0234);IS;Application Setup Number
(300A,0236);LO;Application Setup Name
(300A,0238);LO;Application Setup Manufacturer
(300A,0240);IS;Template Number
(300A,0242);SH;Template Type
(300A,0244);LO;Template Name
(300A,0250);DS;Total Reference Air Kerma
(300A,0260);SQ;Brachy Accessory Device Sequence
(300A,0262);IS;Brachy Accessory Device Number
(300A,0263);SH;Brachy Accessory Device ID
(300A,0264);CS;Brachy Accessory Device Type
(300A,0266);LO;Brachy Accessory Device Name
(300A,026A);DS;Brachy Accessory Device Nominal Thickness
(300A,026C);DS;Brachy Accessory Device Nominal Transmission
(300A,0280);SQ;Channel Sequence
(300A,0282);IS;Channel Number
(300A,0284);DS;Channel Length
(300A,0286);DS;Channel Total Time
(300A,0288);CS;Source Movement Type
(300A,028A);IS;Number of Pulses
(300A,028C);DS;Pulse Repetition Interval
(300A,0290);IS;Source Applicator Number
(300A,0291);SH;Source Applicator ID
(300A,0292);CS;Source Applicator Type
(300A,0294);LO;Source Applicator Name
(300A,0296);DS;Source Applicator Length
(300A,0298);LO;Source Applicator Manufacturer
(300A,029C);DS;Source Applicator Wall Nominal Thickness
(300A,029E);DS;Source Applicator Wall Nominal Transmission
(300A,02A0);DS;Source Applicator Step Size
(300A,02A2);IS;Transfer Tube Number
(300A,02A4);DS;Transfer Tube Length
(300A,02B0);SQ;Channel Shield Sequence
(300A,02B2);IS;Channel Shield Number
(300A,02B3);SH;Channel Shield ID
(300A,02B4);LO;Channel Shield Name
(300A,02B8);DS;Channel Shield Nominal Thickness
(300A,02BA);DS;Channel Shield Nominal Transmission
(300A,02C8);DS;Final Cumulative Time Weight
(300A,02D0);SQ;Brachy Control Point Sequence
(300A,02D2);DS;Control Point Relative Position
(300A,02D4);DS;Control Point 3D Position
(300A,02D6);DS;Cumulative Time Weight
(300A,02E0);CS;Compensator Divergence
(300A,02E1);CS;Compensator Mounting Position
(300A,02E2);DS;Source to Compensator Distance
(300A,02E3);FL;Total Compensator Tray Water-Equivalent Thickness
(300A,02E4);FL;Isocenter to Compensator Tray Distance
(300A,02E5);FL;Compensator Column Offset
(300A,02E6);FL;Isocenter to Compensator Distances
(300A,02E7);FL;Compensator Relative Stopping Power Ratio
(300A,02E8);FL;Compensator Milling Tool Diameter
(300A,02EA);SQ;Ion Range Compensator Sequence
(300A,02EB);LT;Compensator Description
(300A,0302);IS;Radiation Mass Number
(300A,0304);IS;Radiation Atomic Number
(300A,0306);SS;Radiation Charge State
(300A,0308);CS;Scan Mode
(300A,0309);CS;Modulated Scan Mode Type
(300A,030A);FL;Virtual Source-Axis Distances
(300A,030C);SQ;Snout Sequence
(300A,030D);FL;Snout Position
(300A,030F);SH;Snout ID
(300A,0312);IS;Number of Range Shifters
(300A,0314);SQ;Range Shifter Sequence
(300A,0316);IS;Range Shifter Number
(300A,0318);SH;Range Shifter ID
(300A,0320);CS;Range Shifter Type
(300A,0322);LO;Range Shifter Description
(300A,0330);IS;Number of Lateral Spreading Devices
(300A,0332);SQ;Lateral Spreading Device Sequence
(300A,0334);IS;Lateral Spreading Device Number
(300A,0336);SH;Lateral Spreading Device ID
(300A,0338);CS;Lateral Spreading Device Type
(300A,033A);LO;Lateral Spreading Device Description
(300A,033C);FL;Lateral Spreading Device Water Equivalent Thickness
(300A,0340);IS;Number of Range Modulators
(300A,0342);SQ;Range Modulator Sequence
(300A,0344);IS;Range Modulator Number
(300A,0346);SH;Range Modulator ID
(300A,0348);CS;Range Modulator Type
(300A,034A);LO;Range Modulator Description
(300A,034C);SH;Beam Current Modulation ID
(300A,0350);CS;Patient Support Type
(300A,0352);SH;Patient Support ID
(300A,0354);LO;Patient Support Accessory Code
(300A,0355);LO;Tray Accessory Code
(300A,0356);FL;Fixation Light Azimuthal Angle
(300A,0358);FL;Fixation Light Polar Angle
(300A,035A);FL;Meterset Rate
(300A,0360);SQ;Range Shifter Settings Sequence
(300A,0362);LO;Range Shifter Setting
(300A,0364);FL;Isocenter to Range Shifter Distance
(300A,0366);FL;Range Shifter Water Equivalent Thickness
(300A,0370);SQ;Lateral Spreading Device Settings Sequence
(300A,0372);LO;Lateral Spreading Device Setting
(300A,0374);FL;Isocenter to Lateral Spreading Device Distance
(300A,0380);SQ;Range Modulator Settings Sequence
(300A,0382);FL;Range Modulator Gating Start Value
(300A,0384);FL;Range Modulator Gating Stop Value
(300A,0386);FL;Range Modulator Gating Start Water Equivalent Thickness
(300A,0388);FL;Range Modulator Gating Stop Water Equivalent Thickness
(300A,038A);FL;Isocenter to Range Modulator Distance
(300A,0390);SH;Scan Spot Tune ID
(300A,0391);IS;Scan Spot Prescribed Indices
(300A,0392);IS;Number of Scan Spot Positions
(300A,0393);CS;Scan Spot Reordered
(300A,0394);FL;Scan Spot Position Map
(300A,0395);CS;Scan Spot Reordering Allowed
(300A,0396);FL;Scan Spot Meterset Weights
(300A,0398);FL;Scanning Spot Size
(300A,039A);IS;Number of Paintings
(300A,03A0);SQ;Ion Tolerance Table Sequence
(300A,03A2);SQ;Ion Beam Sequence
(300A,03A4);SQ;Ion Beam Limiting Device Sequence
(300A,03A6);SQ;Ion Block Sequence
(300A,03A8);SQ;Ion Control Point Sequence
(300A,03AA);SQ;Ion Wedge Sequence
(300A,03AC);SQ;Ion Wedge Position Sequence
(300A,0401);SQ;Referenced Setup Image Sequence
(300A,0402);ST;Setup Image Comment
(300A,0410);SQ;Motion Synchronization Sequence
(300A,0412);FL;Control Point Orientation
(300A,0420);SQ;General Accessory Sequence
(300A,0421);SH;General Accessory ID
(300A,0422);ST;General Accessory Description
(300A,0423);CS;General Accessory Type
(300A,0424);IS;General Accessory Number
(300A,0425);FL;Source to General Accessory Distance
(300A,0431);SQ;Applicator Geometry Sequence
(300A,0432);CS;Applicator Aperture Shape
(300A,0433);FL;Applicator Opening
(300A,0434);FL;Applicator Opening X
(300A,0435);FL;Applicator Opening Y
(300A,0436);FL;Source to Applicator Mounting Position Distance
(300A,0440);IS;Number of Block Slab Items
(300A,0441);SQ;Block Slab Sequence
(300A,0442);DS;Block Slab Thickness
(300A,0443);US;Block Slab Number
(300A,0450);SQ;Device Motion Control Sequence
(300A,0451);CS;Device Motion Execution Mode
(300A,0452);CS;Device Motion Observation Mode
(300A,0453);SQ;Device Motion Parameter Code Sequence
(300A,0501);FL;Distal Depth Fraction
(300A,0502);FL;Distal Depth
(300A,0503);FL;Nominal Range Modulation Fractions
(300A,0504);FL;Nominal Range Modulated Region Depths
(300A,0505);SQ;Depth Dose Parameters Sequence
(300A,0506);SQ;Delivered Depth Dose Parameters Sequence
(300A,0507);FL;Delivered Distal Depth Fraction
(300A,0508);FL;Delivered Distal Depth
(300A,0509);FL;Delivered Nominal Range Modulation Fractions
(300A,0510);FL;Delivered Nominal Range Modulated Region Depths
(300A,0511);CS;Delivered Reference Dose Definition
(300A,0512);CS;Reference Dose Definition
(300C,0002);SQ;Referenced RT Plan Sequence
(300C,0004);SQ;Referenced Beam Sequence
(300C,0006);IS;Referenced Beam Number
(300C,0007);IS;Referenced Reference Image Number
(300C,0008);DS;Start Cumulative Meterset Weight
(300C,0009);DS;End Cumulative Meterset Weight
(300C,000A);SQ;Referenced Brachy Application Setup Sequence
(300C,000C);IS;Referenced Brachy Application Setup Number
(300C,000E);IS;Referenced Source Number
(300C,0020);SQ;Referenced Fraction Group Sequence
(300C,0022);IS;Referenced Fraction Group Number
(300C,0040);SQ;Referenced Verification Image Sequence
(300C,0042);SQ;Referenced Reference Image Sequence
(300C,0050);SQ;Referenced Dose Reference Sequence
(300C,0051);IS;Referenced Dose Reference Number
(300C,0055);SQ;Brachy Referenced Dose Reference Sequence
(300C,0060);SQ;Referenced Structure Set Sequence
(300C,006A);IS;Referenced Patient Setup Number
(300C,0080);SQ;Referenced Dose Sequence
(300C,00A0);IS;Referenced Tolerance Table Number
(300C,00B0);SQ;Referenced Bolus Sequence
(300C,00C0);IS;Referenced Wedge Number
(300C,00D0);IS;Referenced Compensator Number
(300C,00E0);IS;Referenced Block Number
(300C,00F0);IS;Referenced Control Point Index
(300C,00F2);SQ;Referenced Control Point Sequence
(300C,00F4);IS;Referenced Start Control Point Index
(300C,00F6);IS;Referenced Stop Control Point Index
(300C,0100);IS;Referenced Range Shifter Number
(300C,0102);IS;Referenced Lateral Spreading Device Number
(300C,0104);IS;Referenced Range Modulator Number
(300C,0111);SQ;Omitted Beam Task Sequence
(300C,0112);CS;Reason for Omission
(300C,0113);LO;Reason for Omission Description
(300E,0002);CS;Approval Status
(300E,0004);DA;Review Date
(300E,0005);TM;Review Time
(300E,0008);PN;Reviewer Name
(4000,0010);LT;Arbitrary
(4000,4000);LT;Text Comments
(4008,0040);SH;Results ID
(4008,0042);LO;Results ID Issuer
(4008,0050);SQ;Referenced Interpretation Sequence
(4008,00FF);CS;Report Production Status (Trial)
(4008,0100);DA;Interpretation Recorded Date
(4008,0101);TM;Interpretation Recorded Time
(4008,0102);PN;Interpretation Recorder
(4008,0103);LO;Reference to Recorded Sound
(4008,0108);DA;Interpretation Transcription Date
(4008,0109);TM;Interpretation Transcription Time
(4008,010A);PN;Interpretation Transcriber
(4008,010B);ST;Interpretation Text
(4008,010C);PN;Interpretation Author
(4008,0111);SQ;Interpretation Approver Sequence
(4008,0112);DA;Interpretation Approval Date
(4008,0113);TM;Interpretation Approval Time
(4008,0114);PN;Physician Approving Interpretation
(4008,0115);LT;Interpretation Diagnosis Description
(4008,0117);SQ;Interpretation Diagnosis Code Sequence
(4008,0118);SQ;Results Distribution List Sequence
(4008,0119);PN;Distribution Name
(4008,011A);LO;Distribution Address
(4008,0200);SH;Interpretation ID
(4008,0202);LO;Interpretation ID Issuer
(4008,0210);CS;Interpretation Type ID
(4008,0212);CS;Interpretation Status ID
(4008,0300);ST;Impressions
(4008,4000);ST;Results Comments
(4010,0001);CS;Low Energy Detectors
(4010,0002);CS;High Energy Detectors
(4010,0004);SQ;Detector Geometry Sequence
(4010,1001);SQ;Threat ROI Voxel Sequence
(4010,1004);FL;Threat ROI Base
(4010,1005);FL;Threat ROI Extents
(4010,1006);OB;Threat ROI Bitmap
(4010,1007);SH;Route Segment ID
(4010,1008);CS;Gantry Type
(4010,1009);CS;OOI Owner Type
(4010,100A);SQ;Route Segment Sequence
(4010,1010);US;Potential Threat Object ID
(4010,1011);SQ;Threat Sequence
(4010,1012);CS;Threat Category
(4010,1013);LT;Threat Category Description
(4010,1014);CS;ATD Ability Assessment
(4010,1015);CS;ATD Assessment Flag
(4010,1016);FL;ATD Assessment Probability
(4010,1017);FL;Mass
(4010,1018);FL;Density
(4010,1019);FL;Z Effective
(4010,101A);SH;Boarding Pass ID
(4010,101B);FL;Center of Mass
(4010,101C);FL;Center of PTO
(4010,101D);FL;Bounding Polygon
(4010,101E);SH;Route Segment Start Location ID
(4010,101F);SH;Route Segment End Location ID
(4010,1020);CS;Route Segment Location ID Type
(4010,1021);CS;Abort Reason
(4010,1023);FL;Volume of PTO
(4010,1024);CS;Abort Flag
(4010,1025);DT;Route Segment Start Time
(4010,1026);DT;Route Segment End Time
(4010,1027);CS;TDR Type
(4010,1028);CS;International Route Segment
(4010,1029);LO;Threat Detection Algorithm and Version
(4010,102A);SH;Assigned Location
(4010,102B);DT;Alarm Decision Time
(4010,1031);CS;Alarm Decision
(4010,1033);US;Number of Total Objects
(4010,1034);US;Number of Alarm Objects
(4010,1037);SQ;PTO Representation Sequence
(4010,1038);SQ;ATD Assessment Sequence
(4010,1039);CS;TIP Type
(4010,103A);CS;Version
(4010,1041);DT;OOI Owner Creation Time
(4010,1042);CS;OOI Type
(4010,1043);FL;OOI Size
(4010,1044);CS;Acquisition Status
(4010,1045);SQ;Basis Materials Code Sequence
(4010,1046);CS;Phantom Type
(4010,1047);SQ;OOI Owner Sequence
(4010,1048);CS;Scan Type
(4010,1051);LO;Itinerary ID
(4010,1052);SH;Itinerary ID Type
(4010,1053);LO;Itinerary ID Assigning Authority
(4010,1054);SH;Route ID
(4010,1055);SH;Route ID Assigning Authority
(4010,1056);CS;Inbound Arrival Type
(4010,1058);SH;Carrier ID
(4010,1059);CS;Carrier ID Assigning Authority
(4010,1060);FL;Source Orientation
(4010,1061);FL;Source Position
(4010,1062);FL;Belt Height
(4010,1064);SQ;Algorithm Routing Code Sequence
(4010,1067);CS;Transport Classification
(4010,1068);LT;OOI Type Descriptor
(4010,1069);FL;Total Processing Time
(4010,106C);OB;Detector Calibration Data
(4010,106D);CS;Additional Screening Performed
(4010,106E);CS;Additional Inspection Selection Criteria
(4010,106F);SQ;Additional Inspection Method Sequence
(4010,1070);CS;AIT Device Type
(4010,1071);SQ;QR Measurements Sequence
(4010,1072);SQ;Target Material Sequence
(4010,1073);FD;SNR Threshold
(4010,1075);DS;Image Scale Representation
(4010,1076);SQ;Referenced PTO Sequence
(4010,1077);SQ;Referenced TDR Instance Sequence
(4010,1078);ST;PTO Location Description
(4010,1079);SQ;Anomaly Locator Indicator Sequence
(4010,107A);FL;Anomaly Locator Indicator
(4010,107B);SQ;PTO Region Sequence
(4010,107C);CS;Inspection Selection Criteria
(4010,107D);SQ;Secondary Inspection Method Sequence
(4010,107E);DS;PRCS to RCS Orientation
(4FFE,0001);SQ;MAC Parameters Sequence
(50xx,0005);US;Curve Dimensions
(50xx,0010);US;Number of Points
(50xx,0020);CS;Type of Data
(50xx,0022);LO;Curve Description
(50xx,0030);SH;Axis Units
(50xx,0040);SH;Axis Labels
(50xx,0103);US;Data Value Representation
(50xx,0104);US;Minimum Coordinate Value
(50xx,0105);US;Maximum Coordinate Value
(50xx,0106);SH;Curve Range
(50xx,0110);US;Curve Data Descriptor
(50xx,0112);US;Coordinate Start Value
(50xx,0114);US;Coordinate Step Value
(50xx,1001);CS;Curve Activation Layer
(50xx,2000);US;Audio Type
(50xx,2002);US;Audio Sample Format
(50xx,2004);US;Number of Channels
(50xx,2006);UL;Number of Samples
(50xx,2008);UL;Sample Rate
(50xx,200A);UL;Total Time
(50xx,200C);OB or OW;Audio Sample Data
(50xx,200E);LT;Audio Comments
(50xx,2500);LO;Curve Label
(50xx,2600);SQ;Curve Referenced Overlay Sequence
(50xx,2610);US;Curve Referenced Overlay Group
(50xx,3000);OB or OW;Curve Data
(5200,9229);SQ;Shared Functional Groups Sequence
(5200,9230);SQ;Per-frame Functional Groups Sequence
(5400,0100);SQ;Waveform Sequence
(5400,0110);OB or OW;Channel Minimum Value
(5400,0112);OB or OW;Channel Maximum Value
(5400,1004);US;Waveform Bits Allocated
(5400,1006);CS;Waveform Sample Interpretation
(5400,100A);OB or OW;Waveform Padding Value
(5400,1010);OB or OW;Waveform Data
(5600,0010);OF;First Order Phase Correction Angle
(5600,0020);OF;Spectroscopy Data
(60xx,0010);US;Overlay Rows
(60xx,0011);US;Overlay Columns
(60xx,0012);US;Overlay Planes
(60xx,0015);IS;Number of Frames in Overlay
(60xx,0022);LO;Overlay Description
(60xx,0040);CS;Overlay Type
(60xx,0045);LO;Overlay Subtype
(60xx,0050);SS;Overlay Origin
(60xx,0051);US;Image Frame Origin
(60xx,0052);US;Overlay Plane Origin
(60xx,0060);CS;Overlay Compression Code
(60xx,0061);SH;Overlay Compression Originator
(60xx,0062);SH;Overlay Compression Label
(60xx,0063);CS;Overlay Compression Description
(60xx,0066);AT;Overlay Compression Step Pointers
(60xx,0068);US;Overlay Repeat Interval
(60xx,0069);US;Overlay Bits Grouped
(60xx,0100);US;Overlay Bits Allocated
(60xx,0102);US;Overlay Bit Position
(60xx,0110);CS;Overlay Format
(60xx,0200);US;Overlay Location
(60xx,0800);CS;Overlay Code Label
(60xx,0802);US;Overlay Number of Tables
(60xx,0803);AT;Overlay Code Table Location
(60xx,0804);US;Overlay Bits For Code Word
(60xx,1001);CS;Overlay Activation Layer
(60xx,1100);US;Overlay Descriptor - Gray
(60xx,1101);US;Overlay Descriptor - Red
(60xx,1102);US;Overlay Descriptor - Green
(60xx,1103);US;Overlay Descriptor - Blue
(60xx,1200);US;Overlays - Gray
(60xx,1201);US;Overlays - Red
(60xx,1202);US;Overlays - Green
(60xx,1203);US;Overlays - Blue
(60xx,1301);IS;ROI Area
(60xx,1302);DS;ROI Mean
(60xx,1303);DS;ROI Standard Deviation
(60xx,1500);LO;Overlay Label
(60xx,3000);OB or OW;Overlay Data
(60xx,4000);LT;Overlay Comments
(7FE0,0008);OF;Float Pixel Data
(7FE0,0009);OD;Double Float Pixel Data
(7FE0,0010);OB or OW;Pixel Data
(7FE0,0020);OW;Coefficients SDVN
(7FE0,0030);OW;Coefficients SDHN
(7FE0,0040);OW;Coefficients SDDN
(7Fxx,0010);OB or OW;Variable Pixel Data
(7Fxx,0011);US;Variable Next Data Group
(7Fxx,0020);OW;Variable Coefficients SDVN
(7Fxx,0030);OW;Variable Coefficients SDHN
(7Fxx,0040);OW;Variable Coefficients SDDN
(FFFA,FFFA);SQ;Digital Signatures Sequence
(FFFC,FFFC);OB;Data Set Trailing Padding
(FFFE,E000); ;Item
(FFFE,E00D); ;Item Delimitation Item
(FFFE,E0DD); ;Sequence Delimitation Item""";

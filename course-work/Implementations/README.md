# VidStream - Video Sharing Platform

## 📋 Student Information
**Faculty Number (ФН):** 2301321037

---

## 🎯 Project Name
**VidStream**

---

## 📖 Project Description

VidStream is a modern video-sharing platform designed to revolutionize content creation and online learning. The platform allows users to upload videos, interact with content from other creators, and build a community around shared interests.

### Key Features:
- **Video Upload & Management** - Users can upload and manage their video content
- **Channel System** - Each user can create their own channel
- **User Interaction** - Like, comment, and engage with videos
- **Category Organization** - Videos organized by categories (Gaming, Music, Education, Vlog, Technology, Cooking)
- **Free & Accessible** - Available worldwide at no cost

---

## 🗄️ Database Structure

### Tables (6):
1. **User** - User accounts and authentication
2. **Category** - Video categories
3. **Channel** - User channels
4. **Video** - Video content and metadata
5. **Comment** - User comments on videos
6. **Like** - Video likes/reactions

### Database Objects:
- **1 Stored Procedure:** `sp_AddVideo` - Adds new videos with validation
- **1 Function:** `fn_GetVideoLikeCount` - Returns like count for videos
- **1 Trigger:** `tr_ValidateCommentContent` - Validates comment content on insert/update

---

## 📊 Visualizations

The project includes **3 visualizations** created using Power BI:
1. **Top 10 Most Viewed Videos** (Bar Chart)
2. **Videos Distribution by Category** (Pie Chart)
3. **Channel Performance Comparison** (Clustered Bar Chart)

---

## 📁 Files Structure

```
VidStream-database/
├── VidStream_backup.bak          # Database backup file
├── VidStream_Creation.sql         # Database creation script
├── VidStream_Analytics.pbix       # Power BI report file
└── README.md                      # This file
```

### File Descriptions:
- **VidStream_backup.bak** - Complete database backup for restoration and data preservation
- **SQL files** - Contain queries for database creation, tables, stored procedures, functions, and triggers
- **Power BI file** - Contains all visualizations and dashboard

---

## 🚀 Installation & Setup

### Prerequisites:
- Microsoft SQL Server 2019 or later (MSSM 21)
- SQL Server Management Studio (SSMS)
- Power BI Desktop (optional, for viewing reports)

### Database Setup:

#### Option 1: Restore from Backup
1. Open SQL Server Management Studio (SSMS)
2. Right-click on **Databases** → **Restore Database**
3. Select **Device** → Browse to `VidStream_backup.bak`
4. Click **OK** to restore

#### Option 2: Run SQL Scripts
1. Open SSMS and connect to your SQL Server instance
2. Open `VidStream_Creation.sql`
3. Execute the script (F5)
4. Database, tables, and sample data will be created automatically

### Connection Details:
- **Server:** `localhost\SQLEXPRESS` (or your server name)
- **Database:** `VidStream`
- **Authentication:** Windows Authentication

---

## 📈 Viewing Visualizations

### Using Power BI:
1. Install Power BI Desktop (free from Microsoft)
2. Open `VidStream_Analytics.pbix`
3. View the dashboard with all 3 visualizations

### Connection String (for other tools):
```
Server=localhost\SQLEXPRESS;Database=VidStream;Integrated Security=true;
```

---

## 🛠️ Technologies Used

- **Database:** Microsoft SQL Server 2021
- **Modeling:** Chen's notation (Conceptual), Crow's Foot notation (Logical)
- **Visualization Tool:** Microsoft Power BI Desktop
- **Version Control:** Git & GitHub

---

## 📊 Data Model

### Conceptual Model: Chen's Database Notation
- Entities: User, Channel, Video, Category, Comment, Like
- Relationships: One-to-Many, Many-to-Many

### Logical Model: Crow's Foot Database Notation
- 6 Tables with proper Primary Keys (PK) and Foreign Keys (FK)
- Referential integrity enforced
- Cascade rules implemented

---

## ✅ Project Requirements Checklist

- ✅ **6+ Entities** (User, Channel, Video, Category, Comment, Like)
- ✅ **30+ Attributes** across all tables
- ✅ **Many-to-Many Relationship** (Videos ↔ Likes)
- ✅ **SQL Server Database** with complete schema
- ✅ **1 Stored Procedure** (sp_AddVideo)
- ✅ **1 Function** (fn_GetVideoLikeCount)
- ✅ **1 Trigger** (tr_ValidateCommentContent)
- ✅ **Sample Data** (5 users, 10 videos, 20 likes, 12 comments)
- ✅ **3 Visualizations** in Power BI
- ✅ **GitHub Repository** with complete documentation

---

## 📝 Notes

- The database uses **hard delete** strategy (no soft delete)
- All passwords are stored as hashed values (placeholder hashes in sample data)
- Email addresses must be unique per user
- Usernames must be unique
- Comments are validated for minimum length (2 characters) and maximum length (10,000 characters)

---

## 👤 Author

**Faculty Number:** 2301321037  
**Project:** VidStream - Video Sharing Platform  
**Course:** Software Modeling and Analysis  
**Academic Year:** 2025

---

## 📄 License

This project is created for educational purposes as part of a university course.

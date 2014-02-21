class School < ActiveRecord::Base
  attr_accessible :name, :degree_type, :degree_name, :from, :till, :currently_attending, :highlights,
   :resume_id, :highest_merit, :course_of_study, :completion_year

  belongs_to :resume
  HIGHEST_MERIT = [
    "None/Other", "Completed", "GED", "Certification of Completion",
    "Diploma", "Associate of the Arts", "Associate of Science", "Bachelor of Arts",
    "Bachelor of Science", "Master of Arts", "Master of Science", "PhD"]
  COURSE_OF_STUDY = {
    "Agriculture" =>
      ["Agricultural and Domestic Animal Services",
      "Agricultural and Food Products Processing",
      "Agricultural Business and Management",
      "Agricultural Mechanization",
      "Agricultural Production Operations",
      "Agricultural Public Services",
      "Animal Sciences",
      "Applied Horticulture and Horticultural Business Services",
      "Food Science and Technology",
      "International Agriculture",
      "Plant Sciences",
      "Soil Sciences"],
    "Architecthure" =>
      ["Architectural History and Criticism",
      "Architectural Sciences and Technology",
      "Architecture",
      "City/Urban, Community and Regional Planning",
      "Environmental Design",
      "Interior Architecture",
      "Landscape Architecture",
      "Real Estate Development"],
    "Biological Sciences" =>
      ["Biochemistry, Biophysics and Molecular Biology",
      "Biology",
      "Biomathematics, Bioinformatics, and Computational Biology",
      "Biotechnology",
      "Botany/Plant Biology",
      "Cell/Cellular Biology and Anatomical Sciences",
      "Ecology, Evolution, Systematics, and Population Biology",
      "Genetics",
      "Microbiological Sciences and Immunology",
      "Molecular Medicine",
      "Neurobiology and Neurosciences",
      "Pharmacology and Toxicology",
      "Physiology, Pathology and Related Sciences",
      "Zoology/Animal Biology"],
 "Business Related" =>
    ["Accounting",
    "Business Administration, Management and Operations",
    "Business Operations Support and Assistant Services",
    "Business/Commerce",
    "Business/Corporate Communications",
    "Business/Managerial Economics",
    "Construction Management",
    "Entrepreneurial and Small Business Operations",
    "Finance and Financial Management Services",
    "General Sales, Merchandising and Related Marketing Operations",
    "Hospitality Administration/Management",
    "Human Resources Management and Services",
    "Insurance",
    "International Business",
    "Management Information Systems and Services",
    "Management Sciences and Quantitative Methods",
    "Marketing",
    "Real Estate",
    "Specialized Sales, Merchandising and Marketing Operations",
    "Taxation",
    "Telecommunications Management"],
  "Communication" =>
    ["Communication and Media Studies",
    "Journalism",
    "Public Relations, Advertising, and Applied Communication",
    "Publishing",
    "Radio, Television, and Digital Communication",
    "Audiovisual Communications",
    "Technologies/Technicians",
    "Communications Technology/Technician",
    "Graphic Communications"],
  "Computer Science" =>
    ["Computer and Information Sciences",
    "Computer Programming",
    "Computer Science",
    "Computer Software and Media Applications",
    "Computer Systems Analysis",
    "Computer Systems Networking and Telecommunications",
    "Computer/Information Technology Administration and Management",
    "Data Entry/Microcomputer Applications",
    "Data Processing",
    "Information Science/Studies"],
  "Education" =>
    ["Bilingual, Multilingual, and Multicultural Education",
    "Curriculum and Instruction",
    "Educational Administration and Supervision",
    "Educational Assessment, Evaluation, and Research",
    "Educational/Instructional Media Design",
    "Education",
    "International and Comparative Education",
    "Social and Philosophical Foundations of Education",
    "Special Education and Teaching",
    "Student Counseling and Personnel Services",
    "Teacher Education and Professional Development",
    "Teaching Assistants/Aides",
    "Teaching English or French as a Second or Foreign Language"],
  "Engineering" =>
    ["Aerospace, Aeronautical and Astronautical Engineering",
    "Agricultural Engineering",
    "Architectural Engineering",
    "Biochemical Engineering",
    "Biological/Biosystems Engineering",
    "Biomedical/Medical Engineering",
    "Ceramic Sciences and Engineering",
    "Chemical Engineering",
    "Civil Engineering",
    "Computer Engineering",
    "Construction Engineering",
    "Electrical, Electronics and Communications Engineering",
    "Electromechanical Engineering",
    "Engineering Chemistry",
    "Engineering Mechanics",
    "Engineering Physics",
    "Engineering Science",
    "Engineering",
    "Environmental/Environmental Health Engineering",
    "Forest Engineering",
    "Geological/Geophysical Engineering",
    "Industrial Engineering",
    "Manufacturing Engineering",
    "Materials Engineering",
    "Mechanical Engineering",
    "Mechatronics, Robotics, and Automation Engineering",
    "Metallurgical Engineering",
    "Mining and Mineral Engineering",
    "Naval Architecture and Marine Engineering",
    "Nuclear Engineering",
    "Ocean Engineering",
    "Operations Research",
    "Paper Science and Engineering",
    "Petroleum Engineering",
    "Polymer/Plastics Engineering",
    "Surveying Engineering",
    "Systems Engineering",
    "Textile Sciences and Engineering",
    "Architectural Engineering Technologies/Technicians",
    "Civil Engineering Technologies/Technicians",
    "Computer Engineering Technologies/Technicians",
    "Construction Engineering Technologies",
    "Drafting/Design Engineering Technologies/Technicians",
    "Electrical Engineering Technologies/Technicians",
    "Electromechanical Instrumentation and Maintenance Technologies/Technicians",
    "Engineering-Related Fields",
    "Engineering-Related Technologies",
    "Environmental Control Technologies/Technicians",
    "Industrial Production Technologies/Technicians",
    "Mechanical Engineering Related Technologies/Technicians",
    "Mining and Petroleum Technologies/Technicians",
    "Nanotechnology",
    "Nuclear Engineering Technologies/Technicians",
    "Quality Control and Safety Technologies/Technicians",
    "Forest Engineering",
    "Geological/Geophysical Engineering",
    "Industrial Engineering",
    "Manufacturing Engineering",
    "Materials Engineering",
    "Mechanical Engineering",
    "Mechatronics, Robotics, and Automation EngineeringMetallurgical Engineering",
    "Mining and Mineral Engineering",
    "Naval Architecture and Marine Engineering",
    "Nuclear Engineering",
    "Ocean EngineeringOperations Research",
    "Paper Science and Engineering",
    "Petroleum Engineering",
    "Polymer/Plastics Engineering",
    "Surveying EngineeringSystems Engineering",
    "Textile Sciences and Engineering"]}
end

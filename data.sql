-- Step 1: Deep Clean
USE online_quiz_db;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Options;
TRUNCATE TABLE Questions;
TRUNCATE TABLE Quizzes;
TRUNCATE TABLE Users;
TRUNCATE TABLE Results;

-- Resetting Auto-Increment Counters
ALTER TABLE Quizzes AUTO_INCREMENT = 1;
ALTER TABLE Questions AUTO_INCREMENT = 1;
ALTER TABLE Options AUTO_INCREMENT = 1;
SET FOREIGN_KEY_CHECKS = 1;

-- Step 2: Insert Users
INSERT INTO Users (username, password, role) VALUES 
('Anshika', 'admin123', 'Admin'),
('Ria_Singh', 'ria321', 'Student'),
('Spandan', 'spandan789', 'Student'),
('Jiya', 'Jiya000', 'Student');

-- Step 3: Insert Quizzes (Ensures IDs 1, 2, 3, 4, 5)
INSERT INTO Quizzes (title, category, total_marks) VALUES 
('DBMS Quiz', 'Technical', 100),
('Python Programming Quiz', 'Technical', 100),
('Operating Systems Quiz', 'Core CS', 100),
('COA Quiz', 'Hardware', 100),
('Computer Networks Quiz', 'Core CS', 100);

-- Step 4: Insert Questions in Exact Sequential Order
-- IDs 1-20 (DBMS)
INSERT INTO Questions (quiz_id, question_text, correct_option) VALUES 
(1, 'Which SQL command is used to change the structure of an existing table?', 'ALTER'),
(1, 'What type of relationship exists between a "Department" and "Employees"?', 'One-to-Many'),
(1, 'Which property of ACID ensures that a database transaction is all-or-nothing?', 'Atomicity'),
(1, 'A attribute that uniquely identifies a row in a table is called:', 'Primary Key'),
(1, 'Which JOIN returns all rows from the left table?', 'LEFT JOIN'),
(1, 'Which of the following is known as a "minimal superkey"?', 'Candidate Key'),
(1, 'Which SQL command removes all records but keeps the structure?', 'TRUNCATE'),
(1, 'Which normal form deals with removing Partial Functional Dependency?', '2NF'),
(1, 'Which level of abstraction describes how data is actually stored?', 'Physical'),
(1, 'Which clause is used to filter results after a GROUP BY?', 'HAVING'),
(1, 'Which JOIN returns only the matching rows from both tables?', 'INNER JOIN'),
(1, 'What does the "I" in ACID stand for?', 'Isolation'),
(1, 'A row in a relational database table is also known as a:', 'Tuple'),
(1, 'Which key uniquely identifies a record and can be null?', 'Candidate Key'), 
(1, 'Which language is used to define the database schema?', 'DDL'),
(1, 'Which constraint ensures that a column cannot have duplicate values?', 'UNIQUE'),
(1, 'The process of removing redundancy from a database is called:', 'Normalization'),
(1, 'Which data structure is most commonly used for indexing?', 'B+ Tree'),
(1, 'Which operation in relational algebra selects a subset of columns?', 'Projection'),
(1, 'When transactions wait indefinitely for each other, it is a:', 'Deadlock');



-- IDs 21-40 (Python)
INSERT INTO Questions (quiz_id, question_text, correct_option) VALUES 
(2, 'Which keyword is used to define a function in Python?', 'def'),
(2, 'What is the correct file extension for Python files?', '.py'),
(2, 'Which of the following data types is immutable?', 'Tuple'),
(2, 'How do you start a comment in Python?', '#'),
(2, 'Which function is used to get the length of a list?', 'len()'),
(2, 'What is the output of 3 * "Abc"?', 'AbcAbcAbc'),
(2, 'Which of these is used to handle exceptions in Python?', 'try-except'),
(2, 'What is the correct way to create a dictionary?', '{}'),
(2, 'Which method adds an element at the end of a list?', 'append()'),
(2, 'What does the "self" keyword represent in a class?', 'Instance of the class'),
(2, 'Which of the following is NOT a keyword in Python?', 'eval'),
(2, 'What is the result of 10 // 3 in Python?', '3'),
(2, 'Which library is used for data manipulation and analysis?', 'Pandas'),
(2, 'Which of the following is used to create a virtual environment?', 'venv'),
(2, 'What is the purpose of the "pass" statement?', 'A null operation'),
(2, 'Which function is used to read input from the user?', 'input()'),
(2, 'What is a decorator in Python?', 'A function that modifies another function'),
(2, 'Which of the following is a Python tuple?', '(1, 2, 3)'),
(2, 'What does the "range(5)" function generate?', 'Numbers from 0 to 4'),
(2, 'Which operator checks if two values are equal?', '==');
INSERT INTO Questions (quiz_id, question_text, correct_option) VALUES 
(3, 'What is the main purpose of an Operating System?', 'Resource Management'),
(3, 'Which of the following is NOT a state of a process?', 'Running-Out'),
(3, 'The mechanism that brings a page into memory only when it is needed is:', 'Demand Paging'),
(3, 'Which scheduling algorithm can lead to the problem of "Starvation"?', 'Priority Scheduling'),
(3, 'A situation where processes are blocked waiting for each other is:', 'Deadlock'),
(3, 'Which of the following is a synchronization tool?', 'Semaphore'),
(3, 'What is the full form of PCB in OS?', 'Process Control Block'),
(3, 'The process of moving a program from disk to main memory is handled by:', 'Loader'),
(3, 'Which memory management scheme allows non-contiguous physical address space?', 'Paging'),
(3, 'In which allocation method does each file occupy contiguous blocks?', 'Contiguous Allocation'),
(3, 'What is a "Kernel"?', 'The core part of the OS'),
(3, 'Which system call creates a new process in Unix?', 'fork()'),
(3, 'Interval from submission to completion of a process is:', 'Turnaround Time'),
(3, 'Virtual memory is typically implemented by:', 'Demand Paging'),
(3, 'What is "Spooling"?', 'Simultaneous Peripheral Operations On-Line'),
(3, 'Which directory structure is common in modern OS?', 'Tree Structure'),
(3, 'Which of the following is a Real-Time OS?', 'QNX'),
(3, 'The "Bankers Algorithm" is used for:', 'Deadlock Avoidance'),
(3, 'What is "Thrashing" in OS?', 'High paging activity'),
(3, 'Which command is used in Linux to list files?', 'ls');

-- IDs 61-80 (COA Quiz)
INSERT INTO Questions (quiz_id, question_text, correct_option) VALUES 
(4, 'Which of the following is the "Brain" of the computer system?', 'Central Processing Unit'),
(4, 'The small, high-speed storage locations within the CPU are:', 'Registers'),
(4, 'What does ALU stand for?', 'Arithmetic Logic Unit'),
(4, 'Which architecture uses the same memory for data and instructions?', 'Von Neumann Architecture'),
(4, 'The speed of a processor is measured in:', 'Hertz (Hz)'),
(4, 'Which of the following memory is non-volatile?', 'ROM'),
(4, 'What is the function of the Program Counter (PC)?', 'Stores address of the next instruction'),
(4, 'Which bus points to a specific memory location?', 'Address Bus'),
(4, 'A 16-bit address bus can access how many locations?', '65536'),
(4, 'Which cache mapping allows a block to load into any line?', 'Fully Associative Mapping'),
(4, 'What is the full form of RISC?', 'Reduced Instruction Set Computer'),
(4, 'Which type of interrupt is generated by hardware?', 'External Interrupt'),
(4, 'In a floating-point number, the "Mantissa" represents:', 'Significant digits'),
(4, 'What is "Pipelining" in COA?', 'Execution of multiple instructions simultaneously'),
(4, 'Which flip-flop is used to store 1 bit of data in a register?', 'D Flip-Flop'),
(4, 'Which memory is between CPU and Main Memory?', 'Cache Memory'),
(4, 'What is the purpose of "Micro-operations"?', 'Low-level CPU operations'),
(4, 'Which of the following is an I/O synchronization technique?', 'Polling'),
(4, 'A "Word" in computer architecture usually refers to:', 'Bits processed by CPU at once'),
(4, 'Technique that bypasses CPU for faster I/O is:', 'DMA (Direct Memory Access)');

-- IDs 81-100 (Computer Networks Quiz)
INSERT INTO Questions (quiz_id, question_text, correct_option) VALUES 
(5, 'Which model has 7 layers and is a networking standard?', 'OSI Model'),
(5, 'What is the full form of HTTP?', 'HyperText Transfer Protocol'),
(5, 'Which layer ensures error-free delivery of data?', 'Transport Layer'),
(5, 'What is the size of an IPv4 address?', '32 bits'),
(5, 'Which protocol assigns IP addresses dynamically?', 'DHCP'),
(5, 'Which device operates at the Data Link Layer?', 'Switch'),
(5, 'What is the port number for HTTP?', '80'),
(5, 'Which layer is responsible for routing packets?', 'Network Layer'),
(5, 'What does DNS stand for?', 'Domain Name System'),
(5, 'Which protocol is used for sending emails?', 'SMTP'),
(5, 'What is the purpose of ARP?', 'Map IP to MAC address'),
(5, 'Which topology connects all devices to a central hub?', 'Star Topology'),
(5, 'What is the size of an IPv6 address?', '128 bits'),
(5, 'Which protocol is reliable and connection-oriented?', 'TCP'),
(5, 'What is the range of "Well-known ports"?', '0 to 1023'),
(5, 'Which layer handles encryption/decryption?', 'Presentation Layer'),
(5, 'What is "Full Duplex" communication?', 'Simultaneous two-way communication'),
(5, 'Which command tests host reachability?', 'ping'),
(5, 'What is a "MAC Address" also known as?', 'Physical Address'),
(5, 'Which layer is the bottom-most in OSI?', 'Physical Layer');

-- Step 2: Insert Options for 41-100
-- OS Options (41-60)
INSERT INTO Options (question_id, option_text) VALUES 
(41, 'Word Processing'), (41, 'Resource Management'), (41, 'Database Entry'), (41, 'Browsing'),
(42, 'New'), (42, 'Ready'), (42, 'Running-Out'), (42, 'Terminated'),
(43, 'Segmentation'), (43, 'Demand Paging'), (43, 'Swapping'), (43, 'Fragmentation'),
(44, 'Round Robin'), (44, 'FCFS'), (44, 'Priority Scheduling'), (44, 'SJF'),
(45, 'Deadlock'), (45, 'Context Switch'), (45, 'Interruption'), (45, 'Paging'),
(46, 'Thread'), (46, 'Semaphore'), (46, 'Pipe'), (46, 'Socket'),
(47, 'Process Control Block'), (47, 'Program Control Board'), (47, 'Binary'), (47, 'Core Block'),
(48, 'Compiler'), (48, 'Linker'), (48, 'Loader'), (48, 'Interpreter'),
(49, 'Paging'), (49, 'Single User'), (49, 'Contiguous'), (49, 'Static'),
(50, 'Linked'), (50, 'Indexed'), (50, 'Contiguous Allocation'), (50, 'Dynamic'),
(51, 'App Program'), (51, 'Core part of OS'), (51, 'Hardware'), (51, 'UI'),
(52, 'create()'), (52, 'new()'), (52, 'fork()'), (52, 'spawn()'),
(53, 'Wait Time'), (53, 'Response Time'), (53, 'Throughput'), (53, 'Turnaround Time'),
(54, 'Demand Paging'), (54, 'Bus'), (54, 'Registers'), (54, 'Cache'),
(55, 'Sorting'), (55, 'Scheduling'), (55, 'Simultaneous Peripheral Operations On-Line'), (55, 'Polling'),
(56, 'Single Level'), (56, 'Two Level'), (56, 'Tree Structure'), (56, 'Acyclic Graph'),
(57, 'Windows 10'), (57, 'QNX'), (57, 'Android'), (57, 'Linux'),
(58, 'Detection'), (58, 'Deadlock Avoidance'), (58, 'Recovery'), (58, 'Prevention'),
(59, 'Fast execution'), (59, 'High paging activity'), (59, 'Termination'), (59, 'Formatting'),
(60, 'cd'), (60, 'ls'), (60, 'cp'), (60, 'mv');

-- COA Options (61-80)
INSERT INTO Options (question_id, option_text) VALUES 
(61, 'Monitor'), (61, 'Hard Disk'), (61, 'Central Processing Unit'), (61, 'Keyboard'),
(62, 'Buses'), (62, 'Registers'), (62, 'Caches'), (62, 'Slots'),
(63, 'Arithmetic Logic Unit'), (63, 'All Logic'), (63, 'Array'), (63, 'App Logic'),
(64, 'Harvard'), (64, 'Von Neumann Architecture'), (64, 'RISC'), (64, 'CISC'),
(65, 'Bits'), (65, 'Bytes'), (65, 'Hertz (Hz)'), (65, 'Pixels'),
(66, 'RAM'), (66, 'Cache'), (66, 'ROM'), (66, 'Registers'),
(67, 'Stores data'), (67, 'Stores address of the next instruction'), (67, 'Counts'), (67, 'Math'),
(68, 'Data Bus'), (68, 'Control Bus'), (68, 'Address Bus'), (68, 'System Bus'),
(69, '1024'), (69, '65536'), (69, '4096'), (69, '32768'),
(70, 'Direct Mapping'), (70, 'Set Associative'), (70, 'Fully Associative Mapping'), (70, 'Indirect'),
(71, 'Real'), (71, 'Reduced Instruction Set Computer'), (71, 'Rapid'), (71, 'Root'),
(72, 'Internal'), (72, 'External Interrupt'), (72, 'Software'), (72, 'Virtual'),
(73, 'Exponent'), (73, 'Significant digits'), (73, 'Sign bit'), (73, 'Base'),
(74, 'Data cleaning'), (74, 'Memory saving'), (74, 'Execution of multiple instructions simultaneously'), (74, 'Voltage'),
(75, 'T Flip-Flop'), (75, 'JK'), (75, 'D Flip-Flop'), (75, 'SR'),
(76, 'Hard Disk'), (76, 'Optical'), (76, 'Cache Memory'), (76, 'Virtual'),
(77, 'Updates'), (77, 'Low-level CPU operations'), (77, 'High-level'), (77, 'Inputs'),
(78, 'Polling'), (78, 'Paging'), (78, 'Caching'), (78, 'Segmentation'),
(79, '1 bit'), (79, '8 bits'), (79, 'Bits processed by CPU at once'), (79, 'Sentence'),
(80, 'Paging'), (80, 'Interrupt'), (80, 'DMA (Direct Memory Access)'), (80, 'Programmed I/O');

-- CN Options (81-100)
INSERT INTO Options (question_id, option_text) VALUES 
(81, 'TCP/IP'), (81, 'OSI Model'), (81, 'ISO'), (81, 'NetBIOS'),
(82, 'HyperText Transfer Protocol'), (82, 'High Transfer'), (82, 'Hyper Terminal'), (82, 'None'),
(83, 'Physical'), (83, 'Data Link'), (83, 'Transport Layer'), (83, 'Session'),
(84, '16 bits'), (84, '32 bits'), (84, '64 bits'), (84, '128 bits'),
(85, 'DNS'), (85, 'DHCP'), (85, 'FTP'), (85, 'HTTP'),
(86, 'Hub'), (86, 'Router'), (86, 'Switch'), (86, 'Repeater'),
(87, '21'), (87, '25'), (87, '80'), (87, '443'),
(88, 'Physical'), (88, 'Network Layer'), (88, 'Application'), (88, 'Presentation'),
(89, 'Domain Name System'), (89, 'Data Name'), (89, 'Digital'), (89, 'Network Service'),
(90, 'POP3'), (90, 'IMAP'), (90, 'SMTP'), (90, 'HTTP'),
(91, 'MAC to IP'), (91, 'Map IP to MAC address'), (91, 'URL to IP'), (91, 'Port'),
(92, 'Bus'), (92, 'Ring'), (92, 'Star Topology'), (92, 'Mesh'),
(93, '32 bits'), (93, '48 bits'), (93, '64 bits'), (93, '128 bits'),
(94, 'UDP'), (94, 'IP'), (94, 'TCP'), (94, 'ICMP'),
(95, '0-255'), (95, '0 to 1023'), (95, '0-65535'), (95, '1024-49151'),
(96, 'Application'), (96, 'Presentation Layer'), (96, 'Session'), (96, 'Transport'),
(97, 'One-way'), (97, 'Two-way, one at a time'), (97, 'Simultaneous two-way communication'), (97, 'No communication'),
(98, 'tracert'), (98, 'ipconfig'), (98, 'ping'), (98, 'netstat'),
(99, 'Logical'), (99, 'Service'), (99, 'Physical Address'), (99, 'Domain'),
(100, 'Network'), (100, 'Data Link'), (100, 'Physical Layer'), (100, 'Session');
INSERT INTO Options (question_id, option_text) VALUES 
(1, 'UPDATE'), (1, 'MODIFY'), (1, 'ALTER'), (1, 'CHANGE'),
(2, 'One-to-One'), (2, 'One-to-Many'), (2, 'Many-to-Many'), (2, 'None'),
(3, 'Consistency'), (3, 'Isolation'), (3, 'Durability'), (3, 'Atomicity'),
(4, 'Alternate Key'), (4, 'Foreign Key'), (4, 'Primary Key'), (4, 'Candidate Key'),
(5, 'LEFT JOIN'), (5, 'INNER JOIN'), (5, 'RIGHT JOIN'), (5, 'OUTER JOIN'),
(6, 'Foreign Key'), (6, 'Candidate Key'), (6, 'Composite Key'), (6, 'Primary Key'),
(7, 'DELETE'), (7, 'DROP'), (7, 'TRUNCATE'), (7, 'REMOVE'),
(8, '1NF'), (8, '2NF'), (8, '3NF'), (8, 'BCNF'),
(9, 'Logical'), (9, 'Conceptual'), (9, 'Physical'), (9, 'External'),
(10, 'WHERE'), (10, 'HAVING'), (10, 'FILTER'), (10, 'ORDER BY'),
(11, 'LEFT JOIN'), (11, 'RIGHT JOIN'), (11, 'INNER JOIN'), (11, 'FULL JOIN'),
(12, 'Integrity'), (12, 'Isolation'), (12, 'Independence'), (12, 'Iteration'),
(13, 'Attribute'), (13, 'Relation'), (13, 'Tuple'), (13, 'Entity'),
(14, 'Primary Key'), (14, 'Foreign Key'), (14, 'Candidate Key'), (14, 'Unique Key'),
(15, 'DML'), (15, 'DDL'), (15, 'DCL'), (15, 'TCL'),
(16, 'NOT NULL'), (16, 'PRIMARY KEY'), (16, 'UNIQUE'), (16, 'DEFAULT'),
(17, 'Encapsulation'), (17, 'Normalization'), (17, 'Abstraction'), (17, 'Indexing'),
(18, 'Array'), (18, 'Linked List'), (18, 'B+ Tree'), (18, 'Stack'),
(19, 'Selection'), (19, 'Projection'), (19, 'Join'), (19, 'Union'),
(20, 'Starvation'), (20, 'Deadlock'), (20, 'Concurrency'), (20, 'Serialization');

-- Options for Questions 21-40 (Python)
INSERT INTO Options (question_id, option_text) VALUES 
(21, 'func'), (21, 'define'), (21, 'def'), (21, 'function'),
(22, '.pt'), (22, '.py'), (22, '.pyt'), (22, '.python'),
(23, 'List'), (23, 'Dictionary'), (23, 'Set'), (23, 'Tuple'),
(24, '//'), (24, '/*'), (24, '#'), (24, '--'),
(25, 'length()'), (25, 'size()'), (25, 'len()'), (25, 'count()'),
(26, 'Error'), (26, '3Abc'), (26, 'AbcAbcAbc'), (26, 'Abc3'),
(27, 'try-except'), (27, 'catch-throw'), (27, 'error-handle'), (27, 'if-else'),
(28, '[]'), (28, '{}'), (28, '()'), (28, '<>'),
(29, 'add()'), (29, 'insert()'), (29, 'extend()'), (29, 'append()'),
(30, 'The class itself'), (30, 'Instance of the class'), (30, 'Global variable'), (30, 'Header'),
(31, 'break'), (31, 'eval'), (31, 'while'), (31, 'lambda'),
(32, '3.33'), (32, '3'), (32, '3.0'), (32, '4'),
(33, 'NumPy'), (33, 'Pandas'), (33, 'Matplotlib'), (33, 'Scikit-learn'),
(34, 'pip'), (34, 'venv'), (34, 'npm'), (34, 'git'),
(35, 'Exit the loop'), (35, 'Skip next iteration'), (35, 'A null operation'), (35, 'Stop execution'),
(36, 'scanf()'), (36, 'get()'), (36, 'read()'), (36, 'input()'),
(37, 'A class'), (37, 'A variable'), (37, 'A function that modifies another function'), (37, 'A loop'),
(38, '[1, 2]'), (38, '{1, 2}'), (38, '(1, 2, 3)'), (38, 'None'),
(39, '0 to 5'), (39, '1 to 5'), (39, '0 to 4'), (39, '1 to 4'),
(40, '='), (40, '=='), (40, 'is'), (40, 'equals');

-- Step 6: Initial Results (Dynamic Lookup)
INSERT INTO Results (user_id, quiz_id, score) 
SELECT user_id, 1, 85 FROM Users WHERE username = 'Ria_Singh';
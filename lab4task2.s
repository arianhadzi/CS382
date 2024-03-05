.text
.global _start
.extern scanf

_start:
    
    ADR   x0, fmt_str   // Load address of formated string
    ADR   x1, left      // Load &left
    ADR   x2, right     // Load &right
    ADR   x3, target    // Load &target
    BL    scanf         // scanf("%ld %ld %ld", &left, &right, &target);

    ADR   x1, left      // Load &left
    LDR   x1, [x1]      // Store left in x1
    ADR   x2, right     // Load &right
    LDR   x2, [x2]      // Store right in x2
    ADR   x3, target    // Load &target
    LDR   x3, [x3]      // Store target in x3

    /* Your code here */

    CMP x3, x1  // Compares x3 (target) to x1 (left)
    B.LT not_in_range   // If target is less than left, branch to not in range

    CMP x3, x2  // Compares x3 (target) to x1 (right)
    B.GE not_in_range   // If target is greater than or equal to right, branch to not in range

    // If no branching occurs, print yes
    MOV x0, 1 // Destination register for printing, value is 1
    ADR x1, yes // Loads &yes into x1
    ADR x3, len_yes // Loads &len_yes into x3
    LDR x2, [x3] // Stores value of x3 into x2
    MOV x8, 64 // System call to print
    SVC 0 // Exit system call
    B exit // Branch to exit label to avoid not_in_range

//If target is not in range, print no 
not_in_range:
    MOV x0, 1 // Destination register for printing, value is 1
    ADR x1, no // Loads &no into x1
    ADR x3, len_no // Loads &len_no into x3
    LDR x2, [x3] // Stores value of x3 into x2
    MOV X8, 64  // System call to print
    SVC 0 // Exit system call

exit:
    MOV   x0, 0        // Pass 0 to exit()
    MOV   x8, 93       // Move syscall number 93 (exit) to x8
    SVC   0            // Invoke syscall

.data
    left:    .quad     0
    right:   .quad     0
    target:  .quad     0
    fmt_str: .string   "%ld%ld%ld"
    yes:     .string   "Target is in range\n"
    len_yes: .quad     . - yes  // Calculate the length of string yes
    no:      .string   "Target is not in range\n"
    len_no:  .quad     . - no   // Calculate the length of string no


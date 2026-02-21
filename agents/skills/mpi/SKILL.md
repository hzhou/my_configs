---
name: mpi
description: Generates MPI test code
---

## Instructions
- No comments or only block level comment that describes the intent of a block of code.
- Declare "MPI_Comm comm = MPI_COMM_WORLD;" and use comm for the rest of the test code.
- Use MPI_INT for datatype, and count of 10.
- Try avoid directly use literal numbers. Use a variable instead, e.g. "int tag = 0;"
- Don't try compile and run the code.

Code generation experients
---------------------------------------------------------------------------
Objective: Load a structure from a MAT file on an arm cortex A9 based 
embedded platform.

Problem: No code generation for MATLAB's 'load' function.

Solution Requested: Any method by which we can load a MAT file that works
both during algorithm development and C in code.

Experiments Tried: Code listed below is self contained to reproduce the 
issue. Function createData is used to generate a MAT file followed by
codegen. Four veriations were tried.

Results: The output generated for all experiments is listed under 'Method'
1. loadBuiltin fails to generate code. It uses 'load' function
2. loadCoderBuiltin fails to generate code. It uses 'coder.load' function
3. loadBuiltinFix uses a fixed filename and successfully generates code. 
   The problem here is that the C code also contains a hardcoded file name.
   If this is the recommended method, then we need a way to pass filename 
   as argument.
4. loadCoderBuiltinFix also uses a fixed filename and successfully 
   generates code. The C code hardcodes the content of the datafile!!! 
   This one is only useful if some default data is being loaded at compile 
   time. 

---------------------------------------------------------------------------
Source Files:
-(1)-----------------------------------------------------------------------
function data = createData()
    data.bearing.sr = 97656;
    data.bearing.gs = [0.8315881; 0.0387017; 0.4676445; 0.6616452; ...
        1.770335; 1.523985; 1.916429; 0.5592487; 0.3270139; -1.082491];
    data.bearing.load = 270;
    data.bearing.rate = 25;
    save('datafile.mat', 'data');
end

-(2)-----------------------------------------------------------------------
function data = loadBuiltin(filename) %#codegen
    data = load(filename);
end

-(3)-----------------------------------------------------------------------
function data = loadCoderBuiltin(filename) %#codegen
    data = coder.load(filename);
end

-(4)-----------------------------------------------------------------------
function data = loadBuiltinFix() %#codegen
    data = load('datafile');
end

---------------------------------------------------------------------------
function data = loadCoderBuiltinFix() %#codegen
    data = coder.load('datafile');
end

---------------------------------------------------------------------------
Create Data File:
---------------------------------------------------------------------------
Trial>> createData

---------------------------------------------------------------------------
Method loadBuiltin:
---------------------------------------------------------------------------
Trial>> codegen 'loadBuiltin' '-args' 'datafile.mat'
??? Non-constant expression or empty matrix. This expression must be constant because its value determines the
size or class of some expression.

Error in ==> loadBuiltin Line: 2 Column: 17
Code generation failed: View Error Report
Error using codegen

---------------------------------------------------------------------------
Method loadCoderBuiltin:
---------------------------------------------------------------------------
Trial>> codegen 'loadCoderBuiltin' '-args' 'datafile.mat' 
??? Non-constant expression or empty matrix. This expression must be constant because its value determines
the size or class of some expression.

Error in ==> loadCoderBuiltin Line: 2 Column: 23
Code generation failed: View Error Report
Error using codegen

---------------------------------------------------------------------------
Method loadBuiltinFix:
---------------------------------------------------------------------------
Trial>> codegen 'loadBuiltinFix'
Trial>> 

---------------------------------------------------------------------------
loadBuiltInFix.c
---------------------------------------------------------------------------
...
void loadBuiltinFix(const emlrtStack *sp, struct0_T *data)
{
  const mxArray *y;
  const mxArray *m0;
  emlrtStack st;
  st.prev = sp;
  st.tls = sp->tls;
  y = NULL;
  m0 = emlrtCreateString("datafile");
  emlrtAssign(&y, m0);
  st.site = &emlrtRSI;
  emlrt_marshallIn(&st, load(&st, y, &emlrtMCI), "load", data);
}

---------------------------------------------------------------------------
Method loadCoderBuiltinFix:
---------------------------------------------------------------------------
Trial>> codegen 'loadCoderBuiltinFix'
Trial>> 

---------------------------------------------------------------------------
loadCoderBuiltInFix.c
---------------------------------------------------------------------------
...
void loadCoderBuiltinFix(struct0_T *data)
{
  static struct0_T r0 = { { { 97656.0, /* sr */
        { 0.8315881, 0.0387017, 0.4676445, 0.6616452, 1.770335, 1.523985,
          1.916429, 0.5592487, 0.3270139, -1.082491 },/* gs */
        270.0,                         /* load */
        25.0                           /* rate */
      }                                /* bearing */
    }                                  /* data */
  };

  *data = r0;
}

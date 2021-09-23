//EFHMEB0X JOB ('EUDD,INTL'),'NUESSE',NOTIFY=&SYSUID,
//             MSGLEVEL=(1,1),MSGCLASS=X,CLASS=A,REGION=0M
//*
/*JOBPARM S=CWCC
//*
//*
//*  LOAD THE DEMO TABLE BEFORE EXECUTING THE PROGRAM
//*
//PROCLIB JCLLIB ORDER=SALESSUP.GITDEMO1.TEST.MSTR.CNTL
//EXTRACT EXEC DMTBLOAD
//*
//*  USE THIS JCL IN AN XPEDITER/ECLIPSE LAUNCH CONFIGURATION
//*  TO EXECUTE THE CWKTDB2X TOPAZ FOR TOTAL TEST DEMO PROGRAM
//*
//CWDBPROC PROC
//STEP1    EXEC PGM=IKJEFT01,DYNAMNBR=64,TIME=0005,
// REGION=0M
//*
//STEPLIB DD DISP=SHR,DSN=SALESSUP.&APPL..UT&PATH..LOAD
//        DD DISP=SHR,DSN=SALESSUP.&APPL..FT&PATH..LOAD
//        DD DISP=SHR,DSN=SALESSUP.&APPL..DEVL.LOAD
//        DD DISP=SHR,DSN=SALESSUP.&APPL..MAIN.LOAD
//        DD DISP=SHR,DSN=SALESSUP.&APPL..PROD.LOAD
//        DD DISP=SHR,DSN=DSNB10.DBCC.RUNLIB.LOAD
//        DD DISP=SHR,DSN=DSNB10.DBCC.SDSNEXIT
//        DD DISP=SHR,DSN=DSNB10.SDSNLOAD
//        DD DISP=SHR,DSN=CEE.SCEERUN
//*
//SYSUDUMP DD SYSOUT=*
//ABENDAID DD SYSOUT=*
//ABNLTERM DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSPRT DD SYSOUT=*
//*
//EMPFILE  DD DISP=SHR,DSN=SALESSUP.GITDEMO1.TEST.MSTR.CWKTDB2X.IN
//*
//RPTFILE  DD DISP=SHR,DSN=SALESSUP.GITDEMO1.TEST.MSTR.CWKTDB2X.RPT
//SYSOUT   DD SYSOUT=*
//         PEND
//*
//CWKTDB2X EXEC CWDBPROC,
//         APPL=GITK,
//         PATH=1
//STEP1.SYSTSIN DD *
 DSN SYSTEM(DSCC)
 RUN PROGRAM(CWKTDB2X) PLAN(FTSGITPL) PARMS('00003')
 END
/*
%% when the user downloads a pdf file, and it lands on the ~/ or
%% ~/Downloads dir.

steps(researcherMonitorPdfs,
      [
       'convert to text',
       'extract authors, urls, citations, etc',
       'open authors, urls, citations, etc in web browser',
       'store authors, urls, citations, etc in kbfs files'
      ]).

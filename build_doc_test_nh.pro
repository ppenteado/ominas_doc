outdir='./testnh/'
idldoc,root=getenv('OMINAS_DIR')+'/test',output=outdir,title='OMINAS Documentation',$
 /embed,/statistics,format_style='ominas',overview='./overview.idldoc',comment_style='plain',template_location='./templates_newheader/',/default_private,/debug
replaceoverview,outdir+'overview.html','./overview_demo.html',outdir+'overview.old'
file_copy,['./headerbar.html','empty.html'],outdir,/verbose,/overwrite

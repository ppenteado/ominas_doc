outdir='./testrst/'
idldoc,root=getenv('OMINAS_DIR')+'/test',output=outdir,title='OMINAS Documentation',$
 /embed,/statistics,format_style='ominas',overview='./overview.idldoc',/debug,comment_style='plain',template_prefix='plain-',template_location='./templates_newheader/'
replaceoverview,outdir+'overview.html','./overview_demo.html',outdir+'overview.old'
file_copy,['./headerbar.html','empty.html'],outdir,/verbose,/overwrite

outdir='./newheader/'
idldoc,root=getenv('OMINAS_DIR'),output=outdir,title='OMINAS Documentation',$
 /embed,/statistics,format_style='ominas',overview='./overview.idldoc',comment_style='html',template_location='./templates_newheader/',/nosource
replaceoverview,outdir+'overview.html','./overview.html',outdir+'overview.old'
file_copy,'./headerbar_home.html',outdir,/verbose,/overwrite

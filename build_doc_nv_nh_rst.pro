outdir='./testrst/nv/'
idldoc,root=getenv('OMINAS_DIR')+'/nv',output=outdir,title='OMINAS Documentation',$
 format_style='ominas',overview='./overview.idldoc',/nosource,/user,/default_private,comment_style='rst',template_prefix='rst-',template_location='./templates_newheader/'
replaceoverview,outdir+'overview.html','./overview_api.html',outdir+'overview.old'
file_copy,'./headerbar.html',outdir,/verbose,/overwrite

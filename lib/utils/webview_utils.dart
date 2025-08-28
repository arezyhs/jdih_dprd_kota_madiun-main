import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<void> injectHideFooterAndTableJS(InAppWebViewController controller,
    {bool enableTableScroll = false}) async {
  String js = '''
		var footers = document.getElementsByTagName('footer');
		for(var i=0;i<footers.length;i++){footers[i].style.display='none';}
		var footerById = document.getElementById('footer');
		if(footerById){footerById.style.display='none';}
		var footerByClass = document.getElementsByClassName('footer');
		for(var i=0;i<footerByClass.length;i++){footerByClass[i].style.display='none';}
	''';
  if (enableTableScroll) {
    js += '''
			var tables = document.getElementsByTagName('table');
			for(var i=0;i<tables.length;i++){
				tables[i].style.width='100%';
				tables[i].style.display='block';
				tables[i].style.overflowX='auto';
				tables[i].style.whiteSpace='nowrap';
			}
		''';
  }
  await controller.evaluateJavascript(source: js);
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter_html_all/flutter_html_all.dart';

class FlutterHTMLExample extends StatefulWidget {
  const FlutterHTMLExample({super.key});

  @override
  FlutterHTMLExampleState createState() => FlutterHTMLExampleState();
}

const htmlData = r"""
<div class=\"covermain\">\n<div class=\"container\">\n<div class=\"pagebanner\"><img src=\"https://stage.ezkrt.com/webservices/request.php?method=cms&id=14/img/cms/one-1.png/" alt=\"page-banner.png\" /></div>\n<div class=\"online-trasaction py-5\">\n<p>eZPay is now available for online transactions.</p>\n<p class=\"mb-2\">Shop at eZkrt store, web or app for AED 1500 or above and convert in 18/24 months installments using eZkrt - eZPay.</p>\n<p class=\"mb-4\">Available for credit cards of leading banks in UAE.</p>\n</div>\n<div class=\"online-trasaction online-trasaction2 pb-5\">\n<p class=\"mb-2\">Terms &amp; Conditions apply.</p>\n<h3>How to use eZPay</h3>\n<p>Simply enter the Card details while checking out. An option to choose from 18 and 24 months will get activated as you enter your card.A one-time processing fee will be charged to your card.</p>\n<p>If processing fee is not charged please contacts us immediately on support@ezpay.com</p>\n</div>\n<div class=\"cover-row\">\n<div class=\"row\">\n<div class=\"col-md-6\">\n<div class=\"icons-1 mb-5\"><img src=\"../img/cms/one-1.png\" alt=\"one-1.png\" />\n<h5>Shop for AED 1500 or above. <br />Convert your purchases to affordable 18/24 months installments</h5>\n</div>\n</div>\n<div class=\"col-md-6\">\n<div class=\"icons-1 mb-5\"><img src=\"../img/cms/one-2.png\" alt=\"one-2.png\" />\n<h5>Shop for AED 1500 or above. <br />Convert your purchases to affordable 18/24 months installments</h5>\n</div>\n</div>\n<div class=\"col-md-6\">\n<div class=\"icons-1 mb-5\"><img src=\"../img/cms/one-3.png\" alt=\"one-3.png\" />\n<h5>Shop for AED 1500 or above. <br />Convert your purchases to affordable 24 months installments</h5>\n</div>\n</div>\n<div class=\"col-md-6\">\n<div class=\"icons-1 mb-5\"><img src=\"../img/cms/one-4.png\" alt=\"one-4.png\" />\n<h5>Shop for AED 1500 or above. <br />Convert your purchases to affordable 18/24 months installments</h5>\n</div>\n</div>\n</div>\n</div>\n<div class=\"cover-list mt-3\">\n<h4>Terms &amp; Conditions:</h4>\n<ul class=\"list-unstyled mb-0\">\n<li>One time processing fee (9% for 18 months and 12% for 24 months) will be charged</li>\n<li>5% VAT charges applicable to processing fee.</li>\n<li>eZPay processing fee is not refundable in case of cancellation or refunds. T&amp;C of the bank apply for foreclosure.</li>\n<li>It is mandatory to use the number which is registered with the bank at the checkout.</li>\n<li>eZPay is available on ADCB &amp; Mashreq Credit cards in our stores.</li>\n</ul>\n</div>\n</div>\n</div>
""";

final staticAnchorKey = GlobalKey();

class FlutterHTMLExampleState extends State<FlutterHTMLExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_html Example'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_downward),
        onPressed: () {
          final anchorContext =
              AnchorKey.forId(staticAnchorKey, "bottom")?.currentContext;
          if (anchorContext != null) {
            Scrollable.ensureVisible(anchorContext);
          }
        },
      ),
      body: SingleChildScrollView(
        child: Html(
          anchorKey: staticAnchorKey,
          data: htmlData,
          style: {
            "table": Style(
              backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "th": Style(
              padding: HtmlPaddings.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: HtmlPaddings.all(6),
              border: const Border(bottom: BorderSide(color: Colors.grey)),
            ),
            'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
            'flutter': Style(
              display: Display.block,
              fontSize: FontSize(5, Unit.em),
            ),
            ".second-table": Style(
              backgroundColor: Colors.transparent,
            ),
            ".second-table tr td:first-child": Style(
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.end,
            ),
          },
          extensions: [
            // TagWrapExtension(
            //     tagsToWrap: {"table"},
            //     builder: (child) {
            //       return SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: child,
            //       );
            //     }),
            // TagExtension(
            //   tagsToExtend: {"tex"},
            //   builder: (context) => Math.tex(
            //     context.innerHtml,
            //     mathStyle: MathStyle.display,
            //     textStyle: context.styledElement?.style.generateTextStyle(),
            //     onErrorFallback: (FlutterMathException e) {
            //       return Text(e.message);
            //     },
            //   ),
            // ),
            // TagExtension.inline(
            //   tagsToExtend: {"bird"},
            //   child: const TextSpan(text: "🐦"),
            // ),
            TagExtension(
              tagsToExtend: {"flutter"},
              builder: (context) => CssBoxWidget(
                style: context.styledElement!.style,
                child: FlutterLogo(
                  style: context.attributes['horizontal'] != null
                      ? FlutterLogoStyle.horizontal
                      : FlutterLogoStyle.markOnly,
                  textColor: context.styledElement!.style.color!,
                  size: context.styledElement!.style.fontSize!.value,
                ),
              ),
            ),
            // ImageExtension(
            //   handleAssetImages: false,
            //   handleDataImages: false,
            //   networkDomains: {"flutter.dev"},
            //   child: const FlutterLogo(size: 36),
            // ),
            ImageExtension(
              handleAssetImages: false,
              handleDataImages: false,
              networkDomains: {
                "https://stage.ezkrt.com/webservices/request.php?method=cms&id=14/img/cms/one-1.png"
              },
              networkHeaders: {
                'authorization':
                    "Basic ${base64Encode(utf8.encode('ezkrtadmin:I!2k2Qz2o9'))}",
                'Installation-Id': "37cmapFVYmZdlgBs646f1fbbb2dae"
              },
            ),
            // const MathHtmlExtension(),
            // const AudioHtmlExtension(),
            // const VideoHtmlExtension(),
            // const IframeHtmlExtension(),
            // const TableHtmlExtension(),
            // const SvgHtmlExtension(),
          ],
          onLinkTap: (url, _, __) {
            debugPrint("Opening $url...");
          },
          // onCssParseError: (css, messages) {
          //   debugPrint("css that errored: $css");
          //   debugPrint("error messages:");
          //   for (var element in messages) {
          //     debugPrint(element.toString());
          //   }
          //   return '';
          // },
        ),
      ),
    );
  }
}

/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.31
 * Generated at: 2018-10-12 08:47:08 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.include;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/D:/pol/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/portfolio/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1536023489286L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script>\"undefined\"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:\"49376\",secure:\"49381\"},c={nonSecure:\"http://\",secure:\"https://\"},r={nonSecure:\"127.0.0.1\",secure:\"gapdebug.local.genuitec.com\"},n=\"https:\"===window.location.protocol?\"secure\":\"nonSecure\";script=e.createElement(\"script\"),script.type=\"text/javascript\",script.async=!0,script.src=c[n]+r[n]+\":\"+t[n]+\"/codelive-assets/bundle.js\",e.getElementsByTagName(\"head\")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write(".rolling_panel {\r\n");
      out.write("\tposition: relative;\r\n");
      out.write("\twidth: 800px;\r\n");
      out.write("\theight: 100px;\r\n");
      out.write("\tmargin: 0 auto;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\toverflow: hidden;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".rolling_panel ul {\r\n");
      out.write("\tposition: absolute;\r\n");
      out.write("\tmargin: 5px;\r\n");
      out.write("\tpadding: 0;\r\n");
      out.write("\tlist-style: none;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".rolling_panel ul li {\r\n");
      out.write("\tfloat: left;\r\n");
      out.write("\twidth: 800px;\r\n");
      out.write("\theight: 100px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<body data-genuitec-lp-enabled=\"false\" data-genuitec-file-id=\"wc1-3\" data-genuitec-path=\"/portfolio/src/main/webapp/WEB-INF/views/include/header.jsp\">\r\n");
      out.write("\r\n");
      out.write("\t<nav class=\"navbar navbar-default navbar-fixed-top\" data-genuitec-lp-enabled=\"false\" data-genuitec-file-id=\"wc1-3\" data-genuitec-path=\"/portfolio/src/main/webapp/WEB-INF/views/include/header.jsp\">\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("\t\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\"\r\n");
      out.write("\t\t\t\t\tdata-target=\"#myNavbar\">\r\n");
      out.write("\t\t\t\t\t<span class=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span\r\n");
      out.write("\t\t\t\t\t\tclass=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t<a class=\"navbar-brand\" href=\"home\">어서오세약</a>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"collapse navbar-collapse\" id=\"myNavbar\">\r\n");
      out.write("\t\t\t\t<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("\t\t\t\t\t<li><a href=\"search\">검색</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"pillnon\">의약품정보</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"board\">게시판</a></li>\r\n");
      out.write("\t\t\t\t\t<li><a href=\"guide\">사용가이드</a></li>\r\n");
      out.write("\t\t\t\t\t<li>\t\r\n");
      out.write("\t\t\t\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t\t\t");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("</li>\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"jumbotron text-center\"\r\n");
      out.write("\t\tstyle=\"margin-bottom: 0; padding: 0;\">\r\n");
      out.write("\t\t<br> <br>\r\n");
      out.write("\t\t<div class=\"rolling_panel\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li><h2>공지사항입니다1</h2></li>\r\n");
      out.write("\t\t\t\t<li><h2>공지사항입니다2</h2></li>\r\n");
      out.write("\t\t\t\t<li><h2>공지사항입니다3</h2></li>\r\n");
      out.write("\t\t\t\t<li><h2>공지사항입니다4</h2></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<a href=\"javascript:void(0)\" id=\"prev\"><span\r\n");
      out.write("\t\t\tclass=\"glyphicon glyphicon-triangle-left\"></span></a> <a\r\n");
      out.write("\t\t\thref=\"javascript:void(0)\" id=\"next\"><span\r\n");
      out.write("\t\t\tclass=\"glyphicon glyphicon-triangle-right\"></span></a>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(document).ready(function() {\r\n");
      out.write("\r\n");
      out.write("\t\tvar $panel = $(\".rolling_panel\").find(\"ul\");\r\n");
      out.write("\r\n");
      out.write("\t\tvar itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이\r\n");
      out.write("\t\tvar itemLength = $panel.children().length; // 아이템 수\r\n");
      out.write("\r\n");
      out.write("\t\t// Auto 롤링 아이디\r\n");
      out.write("\t\tvar rollingId;\r\n");
      out.write("\r\n");
      out.write("\t\tauto();\r\n");
      out.write("\r\n");
      out.write("\t\t// 배너 마우스 오버 이벤트\r\n");
      out.write("\t\t$panel.mouseover(function() {\r\n");
      out.write("\t\t\tclearInterval(rollingId);\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t// 배너 마우스 아웃 이벤트\r\n");
      out.write("\t\t$panel.mouseout(function() {\r\n");
      out.write("\t\t\tauto();\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t// 이전 이벤트\r\n");
      out.write("\t\t$(\"#prev\").on(\"click\", prev);\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#prev\").mouseover(function(e) {\r\n");
      out.write("\t\t\tclearInterval(rollingId);\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#prev\").mouseout(auto);\r\n");
      out.write("\r\n");
      out.write("\t\t// 다음 이벤트\r\n");
      out.write("\t\t$(\"#next\").on(\"click\", next);\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#next\").mouseover(function(e) {\r\n");
      out.write("\t\t\tclearInterval(rollingId);\r\n");
      out.write("\t\t});\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#next\").mouseout(auto);\r\n");
      out.write("\r\n");
      out.write("\t\tfunction auto() {\r\n");
      out.write("\r\n");
      out.write("\t\t\t// 2초마다 start 호출\r\n");
      out.write("\t\t\trollingId = setInterval(function() {\r\n");
      out.write("\t\t\t\tstart();\r\n");
      out.write("\t\t\t}, 2000);\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\tfunction start() {\r\n");
      out.write("\t\t\t$panel.css(\"width\", itemWidth * itemLength);\r\n");
      out.write("\t\t\t$panel.animate({\r\n");
      out.write("\t\t\t\t\"left\" : -itemWidth + \"px\"\r\n");
      out.write("\t\t\t}, function() {\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t// 첫번째 아이템을 마지막에 추가하기\r\n");
      out.write("\t\t\t\t$(this).append(\"<li>\" + $(this).find(\"li:first\").html() + \"</li>\");\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t// 첫번째 아이템을 삭제하기\r\n");
      out.write("\t\t\t\t$(this).find(\"li:first\").remove();\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t// 좌측 패널 수치 초기화\r\n");
      out.write("\t\t\t\t$(this).css(\"left\", 0);\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t// 이전 이벤트 실행\r\n");
      out.write("\t\tfunction prev(e) {\r\n");
      out.write("\t\t\t$panel.css(\"left\", -itemWidth);\r\n");
      out.write("\t\t\t$panel.prepend(\"<li>\" + $panel.find(\"li:last\").html() + \"</li>\");\r\n");
      out.write("\t\t\t$panel.animate({\r\n");
      out.write("\t\t\t\t\"left\" : \"0px\"\r\n");
      out.write("\t\t\t}, function() {\r\n");
      out.write("\t\t\t\t$(this).find(\"li:last\").remove();\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\t\t// 다음 이벤트 실행\r\n");
      out.write("\t\tfunction next(e) {\r\n");
      out.write("\t\t\t$panel.animate({\r\n");
      out.write("\t\t\t\t\"left\" : -itemWidth + \"px\"\r\n");
      out.write("\t\t\t}, function() {\r\n");
      out.write("\t\t\t\t$(this).append(\"<li>\" + $(this).find(\"li:first\").html() + \"</li>\");\r\n");
      out.write("\t\t\t\t$(this).find(\"li:first\").remove();\r\n");
      out.write("\t\t\t\t$(this).css(\"left\", 0);\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\tfunction go_Login() {\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl : 'login',\r\n");
      out.write("\t\t\ttype : 'post',\r\n");
      out.write("\t\t\tdata : {\r\n");
      out.write("\t\t\t\tuserid : $('#userid').val(),\r\n");
      out.write("\t\t\t\tuserpwd : $('#userpwd').val()\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\tif (data == \"fail\") {\r\n");
      out.write("\t\t\t\t\talert(\"아이디 또는 비밀번호가 다릅니다!\");\r\n");
      out.write("\t\t\t\t\t$('#userid').val('');\r\n");
      out.write("\t\t\t\t\t$('#userpwd').val('');\r\n");
      out.write("\t\t\t\t} else\r\n");
      out.write("\t\t\t\t\tconsole.log(data);\r\n");
      out.write("\t\t\t\t\t$('#login_tl').text(data);\r\n");
      out.write("// \t\t\t\t\tlocation.reload();\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror : function(req, textStatus, err) {\r\n");
      out.write("\t\t\t\talert(textStatus + \"(\" + req.status + \") : \" + err);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction go_logout() {\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl : 'logout',\r\n");
      out.write("\t\t\ttype : 'post',\r\n");
      out.write("\t\t\tdata : {\r\n");
      out.write("\t\t\t\tuserid : $('#userid').val(),\r\n");
      out.write("\t\t\t\tuserpwd : $('#userpwd').val()\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tsuccess : function() {\r\n");
      out.write("\t\t\t\tlocation.reload();\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror : function(req, textStatus, err) {\r\n");
      out.write("\t\t\t\talert(textStatus + \"(\" + req.status + \") : \" + err);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\n");
      out.write("</script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/views/include/header.jsp(53,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${!empty user_info }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t\t\t\t<a id=\"login_tl\" href=\"\" onclick=\"go_logout()\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user_info }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</a>\r\n");
          out.write("\t\t\t\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /WEB-INF/views/include/header.jsp(56,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${empty user_info }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("\t\t\t\t\t\t\t<a id=\"login_tl\" data-toggle=\"modal\" href=\"\"\r\n");
          out.write("\t\t\t\t\t\t\t\tdata-target=\"#myModal\">로그인</a>\r\n");
          out.write("\t\t\t\t\t\t\t<!-- Modal -->\r\n");
          out.write("\t\t\t\t\t\t\t<div class=\"modal fade\" id=\"myModal\" role=\"dialog\">\r\n");
          out.write("\t\t\t\t\t\t\t\t<div class=\"modal-dialog\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t<!-- Modal content-->\r\n");
          out.write("\t\t\t\t\t\t\t\t\t<div class=\"modal-content\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"modal-header\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t<h4 class=\"modal-title\">아이디와 비밀번호를 입력해 주세요</h4>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"modal-body\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"input-group\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"input-group-addon\"><i\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tclass=\"glyphicon glyphicon-user\"></i></span> <input id=\"userid\"\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t\ttype=\"text\" class=\"form-control\" name=\"userid\"\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tplaceholder=\"id\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t<div class=\"input-group\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t<span class=\"input-group-addon\"><i\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tclass=\"glyphicon glyphicon-lock\"></i></span> <input id=\"userpwd\"\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t\ttype=\"password\" class=\"form-control\" name=\"userpwd\"\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\t\tplaceholder=\"Password\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t<div class=\"modal-footer\">\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\"\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\tdata-dismiss=\"modal\" onclick=\"go_Login()\">login</button>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\"\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t\t\tdata-dismiss=\"modal\">Close</button>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t\t</div>\r\n");
          out.write("\t\t\t\t\t\t");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }
}

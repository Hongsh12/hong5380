package egovframework.example.sample.web;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.sample.service.LoginService;
import egovframework.example.sample.service.LoginVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class LoginController {
	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@RequestMapping(value = "/login.do")
	public String selectBoardList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap modelmap, Model model) throws Exception {
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		
		return "sample/login";
	}
	
	@RequestMapping(value = "/registerView.do")
	public String addSampleView(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("loginVO", new LoginVO());
		return "sample/register";
	}
	
	@RequestMapping(value = "/addregister.do")
	public String addSample(@ModelAttribute("searchVO") SampleDefaultVO searchVO, LoginVO loginVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {
		// Server-Side Validation
		beanValidator.validate(loginVO, bindingResult);
		if (bindingResult.hasErrors()) {
			model.addAttribute("loginVO", loginVO);
			return "sample/deptSampleRegister";
		}

		loginService.insertSample(loginVO);
		status.setComplete();
		return "forward:/login.do";
	}
	@RequestMapping("/loginProcess.do")
	public String login(HttpServletRequest request, @RequestParam("id") String id,
	                    @RequestParam("password") String password,ModelMap model) {
		
		LoginVO loginVO;
			try{
			loginVO = (LoginVO) loginService.authenticate(id, password);
		} catch (Exception e) {
			return "login";
		}
		request.getSession().setAttribute("UserAccount", loginVO);
		
		return "redirect:/registerView.do";

	}
	@RequestMapping("/actionLogin.do")
	public String actionLogin(LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception{
		
		// 1. 일반 로그인 처리
		LoginVO resultVO = loginService.actionLogin(loginVO);
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {
			request.getSession().setAttribute("loginVO", resultVO);
		return "forward:/mainpage.do";
		} else {
			
			return "sample/login";
		}
	}
	@RequestMapping(value = "/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model, LoginVO loginVO) throws Exception {

		RequestContextHolder.getRequestAttributes().removeAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		
		return "forward:/mainpage.do";
	}
}
	

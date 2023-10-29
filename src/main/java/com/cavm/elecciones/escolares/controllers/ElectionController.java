package com.cavm.elecciones.escolares.controllers;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cavm.elecciones.escolares.models.CandidateList;
import com.cavm.elecciones.escolares.models.Election;
import com.cavm.elecciones.escolares.models.Institution;
import com.cavm.elecciones.escolares.models.Student;
import com.cavm.elecciones.escolares.models.Vote;
import com.cavm.elecciones.escolares.services.ICandidateListService;
import com.cavm.elecciones.escolares.services.IElectionService;
import com.cavm.elecciones.escolares.services.IInstitutionService;
import com.cavm.elecciones.escolares.services.IListRoleService;
import com.cavm.elecciones.escolares.services.IStudentService;
import com.cavm.elecciones.escolares.services.IVoteService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/election")
public class ElectionController {
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private IStudentService studentService;
	
	@Autowired
	private ICandidateListService candidateListService;
	
	@Autowired
	private IListRoleService listRoleService;
	
	@Autowired
	private IVoteService voteService;
	
	@Autowired
	private IInstitutionService institutionService;
	
	@Autowired
	private IElectionService electionService;
	
	@GetMapping("")
	public String index(Model model) throws UnknownHostException {
		InetAddress localhost = InetAddress.getLocalHost();
		String ipLocal = localhost.getHostAddress();
		System.out.println(ipLocal);
		Institution institution 	= institutionService.findFirstByOrderByIdAsc();
		Election election 			= electionService.findFirstByOrderByIdAsc();
		httpSession.setAttribute("election", election);
		boolean permissionIp 		= true;
		if(election != null && !election.getIps().isBlank()) {
			permissionIp = false;
			String[] ips = election.getIps().split(";");
			for(int i=0; i<ips.length; i++) {
				System.out.println("ip:"+ips[i]);
				if(ipLocal.equals(ips[i])) {
					permissionIp = true;
					System.out.println("encontrado");
					break;
				}
			}
		}
		if(institution==null)institution = new Institution();
		model.addAttribute("ruta", "election");
		model.addAttribute("institution", institution);
		model.addAttribute("election", election);
		model.addAttribute("permissionIp", permissionIp);
		return "election";
	}
	
	@PostMapping("")
	public String index(Model model, @RequestParam("dni") String dni, RedirectAttributes redirect) {
		Institution institution = institutionService.findFirstByOrderByIdAsc();
		if(institution==null)institution = new Institution();
		model.addAttribute("institution", institution);
		Student student = studentService.findByDni(dni);
		if(student != null) {
			Vote vote = voteService.findByStudent(student);
			if(vote != null) {
				redirect.addFlashAttribute("message", student.getName() + " Usted ya emitió su voto!!");
				return "redirect:/election";
			}else {
				redirect.addFlashAttribute("student", student);
				redirect.addFlashAttribute("election", (Election)httpSession.getAttribute("election"));
				return "redirect:/election/vote";
			}
		}else {
			//model.addAttribute("ruta", "election");
			model.addAttribute("message", "Alumno no registrado");
			return "election";
		}
		
	}
	
	@GetMapping("/vote")
	public String vote(Model model) {
		model.addAttribute("lists", candidateListService.findAllByOrderById());
		return "vote";
	}
	@PostMapping("/vote")
	public String vote(Model model, @RequestParam("lista") Long lista, @RequestParam("student") Long student, RedirectAttributes redirect) {
		if(lista > 0 & student >0) {
			Student studen = new Student();
			studen.setId(student);
			CandidateList list = new CandidateList();
			list.setId(lista);
			Vote vote = new Vote();
			vote.setCandiateList(list);
			vote.setStudent(studen);
			voteService.save(vote);
			redirect.addFlashAttribute("messageVote", "Su voto se registro con exito!!");
			return "redirect:/election";
		}
		model.addAttribute("lists", candidateListService.findAllByOrderById());
		return "vote";
	}
	
	@GetMapping("/list-candidate/{listId}")
	public String listCandidate(Model model, @PathVariable Long listId) {
		model.addAttribute("roles", listRoleService.listRoleByList(listId));
		return "list-candidate";
	}
	
	@GetMapping("/result")
	public String result(Model model) {
		List<Object[]> result = voteService.countVoteByList();
		int size = result.size();
		String[] labels = new String[size];
	    int[] data = new int[size];
	    int i = 0;
	    for(Object[] dato : result){
	        labels[i] = dato[0].toString();
	        data[i] = Integer.parseInt(dato[2].toString());
	        i++;
	    }
		model.addAttribute("results", result);
		model.addAttribute("ruta", "result");
		model.addAttribute("labels", labels);
		model.addAttribute("data", data);
		return "result";
	}
	
	/* CONFIG ELECCION*/
	
	@GetMapping("/config")
	public String config(Model model) {
		Election election = electionService.findFirstByOrderByIdAsc();
		if(election==null)election = new Election();
		model.addAttribute("ruta", "election-config");
		model.addAttribute("title", "Datos de la Elección");
		model.addAttribute("election", election);
		return "election-config";
	}
	
	@PostMapping("/config")
	public String config(@Valid Election election, BindingResult result, @RequestParam MultipartFile logo, RedirectAttributes redirect, Model model) throws IOException {
		if(!election.getName().isBlank()/* && !logo.isEmpty()*/) {
			if(!logo.isEmpty()) {
			Path directorioRecursos = Paths.get("src//main//resources//static/uploads");
			String rootPath 	= directorioRecursos.toFile().getAbsolutePath();
			String extension 	= StringUtils.getFilenameExtension(logo.getOriginalFilename());
			String name			= election.getName().substring(0, 10).replace(" ", "_");
			Path rutaCompleta	= Paths.get(rootPath +"//"+name+"_conf."+extension);
			byte[] bytes 		= logo.getBytes();
			Files.write(rutaCompleta, bytes);
			election.setLogo(name+"_conf."+extension);
			}else {
				if(election.getId()!=null) {
					Election election2 = electionService.findById(election.getId());
					election.setLogo(election2.getLogo());
					redirect.addFlashAttribute("message", new String[] {"OK", "Actualizado con éxito!!!"});
					electionService.save(election);
				return "redirect:/election/config";
				}else {
					model.addAttribute("title", "Datos de la Elección");
					model.addAttribute("election", election);
					model.addAttribute("message", new String[] {"ERROR", "Debe subir su logo!!!"});
					return "election-config";
				}
			}
			electionService.save(election);
			redirect.addFlashAttribute("message", new String[] {"OK", "Registrado con éxito!!!"});
		}else {
			redirect.addFlashAttribute("message", new String[] {"ERROR", "Registra datos!!!"});
		}
		return "redirect:/election/config";
	}
	
	@GetMapping("/missing-vote")
	public String missingVote(Model model) {
		List<Student> students = voteService.findStudentsWithoutVotes();
		//students.forEach(e->System.out.println(e.getDni()));
		model.addAttribute("title", "Faltan emitir su voto");
		model.addAttribute("students", students);
		return "missing-vote";
	} 
}

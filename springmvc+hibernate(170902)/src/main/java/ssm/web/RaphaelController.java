package ssm.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RaphaelController {
	@RequestMapping("/raphael")
    public String helloWorld() {
        return "raphaeldemo";
    }
}

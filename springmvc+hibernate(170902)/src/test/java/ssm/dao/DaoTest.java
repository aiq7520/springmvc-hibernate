package ssm.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ssm.entity.Department;
import ssm.entity.Emp;
import ssm.service.Service;

@ContextConfiguration("/applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class DaoTest {
	//@Autowired
	//private EmpDao empDao;、、、、、、、、、、、、、、、、、测试
	@Autowired               
	private Service empService;
	//@Autowired
	//private HibernateTemplate hibernateTemplate;
	
	
	@Test//创建员工
	public void testSave(){
		for(int i=0;i<1;i++){
			Emp e= new Emp("张三"+i,22,10000);
			Department d = new Department();
			d.setId(1);
			e.setDepartment(d);
			empService.add(e);
		}
	}
	@Test//创建部门
	public void testSaveD(){
			Department d1= new Department("人事部");
			Department d2= new Department("开发部");
			Department d3= new Department("财务部");
			empService.add(d1);
			empService.add(d2);
			empService.add(d3);
	}
}

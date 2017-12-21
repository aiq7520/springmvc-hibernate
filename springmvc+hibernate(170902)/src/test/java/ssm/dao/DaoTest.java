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
	//private EmpDao empDao;��������������������������������������
	@Autowired               
	private Service empService;
	//@Autowired
	//private HibernateTemplate hibernateTemplate;
	
	
	@Test//����Ա��
	public void testSave(){
		for(int i=0;i<1;i++){
			Emp e= new Emp("����"+i,22,10000);
			Department d = new Department();
			d.setId(1);
			e.setDepartment(d);
			empService.add(e);
		}
	}
	@Test//��������
	public void testSaveD(){
			Department d1= new Department("���²�");
			Department d2= new Department("������");
			Department d3= new Department("����");
			empService.add(d1);
			empService.add(d2);
			empService.add(d3);
	}
}

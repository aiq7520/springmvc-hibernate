package ssm.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import ssm.entity.Department;
import ssm.entity.Emp;

@Repository
public class Dao  {
	private final int SIZE = 20;
	@Autowired
	private HibernateTemplate hibernateTemplate;
	public void save(Department d){
		hibernateTemplate.saveOrUpdate(d);
	}
	/////////////////Ô±¹¤
	public void save(Emp e){
		hibernateTemplate.saveOrUpdate(e);
	}
	
	public List<Emp> list(int i){
		int start = (i)*SIZE;
		String hql = "from Emp";
		return hibernateTemplate.execute(new HibernateCallbackImpl<List<Emp>>(hql,start));
	}
	
	public void delete(Integer id){
		hibernateTemplate.delete(hibernateTemplate.get(Emp.class, id));
	}

	public Emp getbyId(Integer id) {
		return hibernateTemplate.get(Emp.class, id);
	}
	
	
	class HibernateCallbackImpl<T> implements HibernateCallback<T>{
		private String hql;
		private int start;
		HibernateCallbackImpl(String hql,int start){
			this.hql = hql;
			this.start=start;
		}
		@SuppressWarnings("unchecked")
		@Override
		public T doInHibernate(Session session) throws HibernateException {
			Query query = session.createQuery(hql);
			query.setFirstResult(start);
	        query.setMaxResults(SIZE);
			return   (T) query.list();
		}
		
	}


	@SuppressWarnings("unchecked")
	public List<Department> getDeptList() {
		return (List<Department>) hibernateTemplate.find("from Department");
	}
}

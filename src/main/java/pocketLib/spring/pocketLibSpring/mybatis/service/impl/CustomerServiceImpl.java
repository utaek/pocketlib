package pocketLib.spring.pocketLibSpring.mybatis.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import pocketLib.spring.pocketLibSpring.mybatis.model.Customer;
import pocketLib.spring.pocketLibSpring.mybatis.service.CustomerService;


@Slf4j
@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	SqlSession sqlSession;

	public CustomerServiceImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int addCustomer(Customer input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("CustomerMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Customer> selectCustomerIdList(Customer input) throws Exception {
		List<Customer> result = null;

		try {
			result = sqlSession.selectList("CustomerMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} 

		return result;
	}

	@Override
	public int getCustomerCount(Customer input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("CustomerMapper.selectCount", input);
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} 

		return result;
	}

	@Override
	public Customer getLoginCheckId(Customer input) throws Exception {
		Customer result = null;
		try {
			result = sqlSession.selectOne("CustomerMapper.LoginCheckId", input);
		} catch (Exception e) {
			
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	@Override
    public int editCustomer(Customer input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.update("CustomerMapper.updateCustomer", input);
            
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        } 
        return result;
    }

	@Override
	public int emailCheck(Customer input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.update("CustomerMapper.emailCheck", input);
            
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        } 
        return result;
	}

	@Override
	public Customer getEmailCheck(Customer input) throws Exception {
		Customer result = null;
		try {
			result = sqlSession.selectOne("CustomerMapper.LoginCheckEmail", input);
		} catch (Exception e) {
			
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Customer newPasswordCheck(Customer input) throws Exception {
		Customer result = null;
		try {
			result = sqlSession.selectOne("CustomerMapper.newPasswordCheck", input);
		} catch (Exception e) {
			
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int newPassword(Customer input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.update("CustomerMapper.newPassword", input);
            
            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        } 
        return result;
	}

	@Override
	public int getCountEmail(Customer input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("CustomerMapper.countEmail", input);
		} catch (Exception e) {

			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} 

		return result;
	}
}

package kr.co.useful.organization.service;

import javax.inject.Inject;

import kr.co.useful.organization.persistence.OrganizationDAO;

public class OrganizationServiceImpl implements OrganizationService{
	@Inject
	private OrganizationDAO dao;
	
}

<%@ include file="../auth/auth.jsp"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Inquiries</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/main.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/dashboard.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/styles/inquiries.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
  </head>

  <body>
    <div class="main-container">
      <%@ include file="../layout/side-bar.jsp"%>
      <div class="main-content">
        <%@ include file="../layout/header.jsp"%>

        <section class="content-section">
          <div class="container">
            <div class="inquiries-container">
              <div class="header-actions">
                <h2 class="section-title">My Inquiries</h2>
                <a
                  href="${pageContext.request.contextPath}/InquiryServlet?action=NEW"
                  class="btn-new-inquiry"
                >
                  <i class="fas fa-plus"></i> New Inquiry
                </a>
              </div>

              <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
              </c:if>

              <c:if test="${not empty errorMessage}">
                <div class="alert alert-error">${errorMessage}</div>
              </c:if>

              <div class="inquiries-list">
                <c:choose>
                  <c:when test="${empty inquiries}">
                    <div class="no-inquiries">
                      <p>You don't have any inquiries yet.</p>
                      <a
                        href="${pageContext.request.contextPath}/InquiryServlet?action=NEW"
                        class="btn-create"
                        >Create your first inquiry</a
                      >
                    </div>
                  </c:when>
                  <c:otherwise>
                    <table class="inquiries-table">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Category</th>
                          <th>Subject</th>
                          <th>Status</th>
                          <th>Date Created</th>
                          <th>Actions</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="inquiry" items="${inquiries}">
                          <tr>
                            <td>${inquiry.id}</td>
                            <td>
                              <span class="category-badge ${inquiry.category}"
                                >${inquiry.category}</span
                              >
                            </td>
                            <td>${inquiry.subject}</td>
                            <td>
                              <span class="status-badge open">Open</span>
                            </td>
                            <td>${inquiry.createdAt}</td>
                            <td class="actions">
                              <a
                                href="${pageContext.request.contextPath}/InquiryServlet?action=VIEW&id=${inquiry.id}"
                                class="btn-view"
                                title="View Details"
                              >
                                <i class="fas fa-eye"></i>
                              </a>
                              <c:if
                                test="${user.id == inquiry.userId || user.type == 'admin' || user.type == 'support'}"
                              >
                                <a
                                  href="${pageContext.request.contextPath}/InquiryServlet?action=VIEW&id=${inquiry.id}#edit"
                                  class="btn-edit"
                                  title="Edit Inquiry"
                                >
                                  <i class="fas fa-edit"></i>
                                </a>
                              </c:if>
                              <c:if
                                test="${user.id == inquiry.userId || user.type == 'admin'}"
                              >
                                <a
                                  href="${pageContext.request.contextPath}/InquiryServlet?action=DELETE&id=${inquiry.id}"
                                  class="btn-delete"
                                  title="Delete Inquiry"
                                  onclick="return confirm('Are you sure you want to delete this inquiry?')"
                                >
                                  <i class="fas fa-trash"></i>
                                </a>
                              </c:if>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </body>
</html>

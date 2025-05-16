<%@ include file="../auth/auth.jsp"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inquiry Details</title>
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
      href="${pageContext.request.contextPath}/styles/view-inquiry.css"
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
            <c:if test="${not empty successMessage}">
              <div class="alert alert-success">${successMessage}</div>
            </c:if>

            <c:if test="${not empty errorMessage}">
              <div class="alert alert-error">${errorMessage}</div>
            </c:if>

            <div class="inquiry-details">
              <div class="inquiry-header">
                <h2>Inquiry #${inquiry.id}</h2>
                <div class="inquiry-actions">
                  <a href="${pageContext.request.contextPath}/InquiryServlet?action=LIST" class="btn-back">
                    <i class="fas fa-arrow-left"></i> Back to List
                  </a>
                  <c:if test="${user.id == inquiry.userId || user.type == 'admin' || user.type == 'support'}">
                    <a href="#" onclick="showEditForm()" class="btn-edit" id="editButton">
                      <i class="fas fa-edit"></i> Edit
                    </a>

                    <a href="${pageContext.request.contextPath}/InquiryServlet?action=DELETE&id=${inquiry.id}" 
                    class="btn-delete" 
                    onclick="return confirm('Are you sure you want to delete this inquiry?')">
                      <i class="fas fa-trash"></i> Delete
                    </a> 
                  </c:if>
                </div>
              </div>

              <div id="viewMode">
                <div class="detail-row">
                  <span class="detail-label">Category</span>
                  <div class="detail-value">
                    <span class="category-badge ${inquiry.category}">${inquiry.category}</span>
                  </div>
                </div>
                <div class="detail-row">
                  <span class="detail-label">Subject</span>
                  <div class="detail-value">${inquiry.subject}</div>
                </div>
                <div class="detail-row">
                  <span class="detail-label">Description</span>
                  <div class="detail-value description-value">${inquiry.description}</div>
                </div>
                <div class="detail-row">
                  <span class="detail-label">Preferred Contact Method</span>
                  <div class="detail-value">${inquiry.contactMethod}</div>
                </div>
                <div class="detail-row">
                  <span class="detail-label">Date Created</span>
                  <div class="detail-value">${inquiry.createdAt}</div>
                </div>
              </div>

           
              <div id="editForm">
                <form action="${pageContext.request.contextPath}/InquiryServlet" method="post">
                  <input type="hidden" name="action" value="UPDATE" />
                  <input type="hidden" name="id" value="${inquiry.id}" />

                  <div class="form-group">
                    <label for="category">Category of Inquiry</label>
                    <select id="category" name="category" class="form-control" required>
                      <option value="billing" ${inquiry.category == 'billing' ? 'selected' : ''}>Billing Issue</option>
                      <option value="technical" ${inquiry.category == 'technical' ? 'selected' : ''}>Technical Support</option>
                      <option value="account" ${inquiry.category == 'account' ? 'selected' : ''}>Account Management</option>
                      <option value="product" ${inquiry.category == 'product' ? 'selected' : ''}>Product Information</option>
                      <option value="other" ${inquiry.category == 'other' ? 'selected' : ''}>Other</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" id="subject" name="subject" class="form-control" 
                           value="${inquiry.subject}" required />
                  </div>

                  <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" 
                              required>${inquiry.description}</textarea>
                  </div>

                  <div class="form-group">
                    <label for="contactMethod">Preferred Contact Method</label>
                    <select id="contactMethod" name="contactMethod" class="form-control" required>
                      <option value="email" ${inquiry.contactMethod == 'email' ? 'selected' : ''}>Email</option>
                      <option value="phone" ${inquiry.contactMethod == 'phone' ? 'selected' : ''}>Phone</option>
                      <option value="sms" ${inquiry.contactMethod == 'sms' ? 'selected' : ''}>SMS</option>
                    </select>
                  </div>

                  <div class="form-buttons">
                    <button type="submit" class="btn-save">Save Changes</button>
                    <button type="button" class="btn-cancel" onclick="hideEditForm()">Cancel</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>

    <script>
      function showEditForm() {
        document.getElementById('viewMode').style.display = 'none';
        document.getElementById('editForm').style.display = 'block';
        document.getElementById('editButton').style.display = 'none';
      }

      function hideEditForm() {
        document.getElementById('viewMode').style.display = 'block';
        document.getElementById('editForm').style.display = 'none';
        document.getElementById('editButton').style.display = 'inline-block';
      }
       
      window.onload = function() {
        if(window.location.hash === '#edit') {
          showEditForm();
        }
      };
    </script>
  </body>
</html> 
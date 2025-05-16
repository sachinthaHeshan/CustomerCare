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
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <style>
      .inquiry-details {
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
        padding: 30px;
        margin-top: 20px;
        border: 1px solid #eaeef2;
        animation: fadeIn 0.5s ease;
      }
      
      @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-15px); }
        to { opacity: 1; transform: translateY(0); }
      }
      
      .inquiry-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
        border-bottom: 2px solid #eef2ff;
        padding-bottom: 18px;
      }
      
      .inquiry-header h2 {
        color: #2d3748;
        font-size: 24px;
        font-weight: 600;
        margin: 0;
      }
      
      .inquiry-actions {
        display: flex;
        gap: 12px;
      }
      
      .inquiry-actions a {
        padding: 10px 40px;
        border-radius: 6px;
        text-decoration: none;
        font-size: 14px;
        font-weight: 500;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
      }
      
      .inquiry-actions a i {
        margin-right: 6px;
      }
      
      .btn-edit {
        background-color: #eef2ff;
        color: #3a0ca3;
        box-shadow: 0 1px 3px rgba(58, 12, 163, 0.1);
      }
      
      .btn-edit:hover {
        background-color: #dae1ff;
        transform: translateY(-2px);
        box-shadow: 0 3px 6px rgba(58, 12, 163, 0.2);
        text-decoration: none;
      }
      
      .btn-back {
        background-color: #4361ee;
        color: white;
        box-shadow: 0 1px 3px rgba(67, 97, 238, 0.2);
      }
      
      .btn-back:hover {
        background-color: #3a0ca3;
        transform: translateY(-2px);
        box-shadow: 0 3px 6px rgba(67, 97, 238, 0.3);
        text-decoration: none;
      }
      
      .btn-delete {
        background-color: #ffebee;
        color: #d32f2f;
        box-shadow: 0 1px 3px rgba(211, 47, 47, 0.1);
      }
      
      .btn-delete:hover {
        background-color: #ffcdd2;
        transform: translateY(-2px);
        box-shadow: 0 3px 6px rgba(211, 47, 47, 0.2);
        text-decoration: none;
      }
      
      .detail-row {
        margin-bottom: 22px;
        background-color: #f8fafc;
        border-radius: 8px;
        padding: 5px 16px 16px;
        transition: all 0.2s ease;
      }
      
      .detail-row:hover {
        background-color: #f1f5f9;
        transform: translateY(-2px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
      }
      
      .detail-label {
        font-weight: 600;
        display: block;
        margin-bottom: 8px;
        color: #4a5568;
        font-size: 14px;
        padding-top: 12px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
      }
      
      .detail-value {
        padding: 14px;
        background-color: #fff;
        border-radius: 6px;
        min-height: 20px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        border: 1px solid #edf2f7;
      }
      
      .description-value {
        min-height: 120px;
        white-space: pre-wrap;
        line-height: 1.6;
      }
      
      #editForm {
        display: none;
        animation: fadeIn 0.5s ease;
      }
      
      .form-group {
        margin-bottom: 20px;
      }
      
      .form-group label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #4a5568;
      }
      
      .form-control {
        width: 100%;
        padding: 12px 14px;
        border: 1px solid #e2e8f0;
        border-radius: 6px;
        font-size: 15px;
        transition: all 0.3s ease;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
      }
      
      .form-control:focus {
        outline: none;
        border-color: #4361ee;
        box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.1);
        transform: translateY(-1px);
      }
      
      textarea.form-control {
        min-height: 150px;
        resize: vertical;
      }
      
      .form-buttons {
        display: flex;
        gap: 12px;
        margin-top: 30px;
      }
      
      .btn-save {
        background-color: #4361ee;
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
        box-shadow: 0 2px 5px rgba(67, 97, 238, 0.3);
      }
      
      .btn-save:hover {
        background-color: #3a0ca3;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(67, 97, 238, 0.4);
      }
      
      .btn-cancel {
        background-color: #fff;
        color: #e63946;
        border: 1px solid #e63946;
        padding: 12px 25px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s ease;
      }
      
      .btn-cancel:hover {
        background-color: #e63946;
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(230, 57, 70, 0.2);
      }
    </style>
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
                  </c:if>
                  <c:if test="${user.type == 'admin'}">
                    <a href="${pageContext.request.contextPath}/InquiryServlet?action=DELETE&id=${inquiry.id}" 
                       class="btn-delete" 
                       onclick="return confirm('Are you sure you want to delete this inquiry?')">
                      <i class="fas fa-trash"></i> Delete
                    </a>
                  </c:if>
                </div>
              </div>

              <!-- View Mode -->
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

              <!-- Edit Form -->
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
      
      // Check if URL hash is #edit and show edit form automatically
      window.onload = function() {
        if(window.location.hash === '#edit') {
          showEditForm();
        }
      };
    </script>
  </body>
</html> 
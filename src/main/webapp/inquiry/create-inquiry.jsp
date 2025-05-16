<%@ include file="../auth/auth.jsp"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Inquiry</title>
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
      href="${pageContext.request.contextPath}/styles/create-inquiry.css"
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
            <div class="form-container">
              <h2 class="form-title">Create New Inquiry</h2>
              <form
                action="${pageContext.request.contextPath}/InquiryServlet"
                method="post"
              >
                <input type="hidden" name="action" value="CREATE" />

                <div class="form-group">
                  <label for="category">Category of Inquiry</label>
                  <select
                    id="category"
                    name="category"
                    class="form-control"
                    required
                  >
                    <option value="" disabled selected>
                      Select a category
                    </option>
                    <option value="billing">Billing Issue</option>
                    <option value="technical">Technical Support</option>
                    <option value="account">Account Management</option>
                    <option value="product">Product Information</option>
                    <option value="other">Other</option>
                  </select>
                </div>

                <div class="form-group">
                  <label for="subject">Subject</label>
                  <input
                    type="text"
                    id="subject"
                    name="subject"
                    class="form-control"
                    placeholder="Brief summary of your inquiry"
                    required
                  />
                </div>

                <div class="form-group">
                  <label for="description">Description</label>
                  <textarea
                    id="description"
                    name="description"
                    class="form-control"
                    placeholder="Please provide details about your inquiry..."
                    required
                  ></textarea>
                </div>

                <div class="form-group">
                  <label>Preferred Contact Method</label>
                  <div class="radio-group">
                    <div class="radio-option">
                      <input
                        type="radio"
                        id="contact-email"
                        name="contactMethod"
                        value="email"
                        required
                      />
                      <label for="contact-email">Email</label>
                    </div>
                    <div class="radio-option">
                      <input
                        type="radio"
                        id="contact-phone"
                        name="contactMethod"
                        value="phone"
                      />
                      <label for="contact-phone">Phone</label>
                    </div>
                  </div>
                </div>

                <div class="button-group">
                  <button
                    type="button"
                    class="btn-cancel"
                    onclick="window.location.href='${pageContext.request.contextPath}/dashboard'"
                  >
                    Cancel
                  </button>
                  <button type="submit" class="btn-submit">
                    Submit Inquiry
                  </button>
                </div>
              </form>
            </div>
          </div>
        </section>
      </div>
    </div>
  </body>
</html>

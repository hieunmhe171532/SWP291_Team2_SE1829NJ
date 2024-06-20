<%-- 
    Document   : aboutus
    Created on : Jun 10, 2024, 4:03:53 PM
    Author     : Linh Linh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f8f9fa;
        }
        .py-5 {
            padding: 3rem 0;
        }
        .container {
            max-width: 1140px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .text-muted {
            color: #6c757d;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        .display-5 {
            font-size: 2.5rem;
            font-weight: 700;
            margin: 1rem 0;
        }
        .lead {
            font-size: 1.25rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
        }
        .text-center {
            text-align: center;
        }
        .section-heading {
            margin-top: 2rem;
            font-size: 1.75rem;
            font-weight: 700;
            color: #343a40;
        }
        .section-content {
            margin-bottom: 2rem;
        }
        .feedback-section {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .feedback-section h3 {
            margin-bottom: 1rem;
        }
        .feedback-section form {
            display: flex;
            flex-direction: column;
        }
        .feedback-section form .form-group {
            margin-bottom: 1rem;
        }
        .feedback-section form .form-group label {
            margin-bottom: 0.5rem;
            font-weight: 700;
        }
        .feedback-section form .form-group input,
        .feedback-section form .form-group textarea {
            padding: 0.75rem;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            width: 100%;
        }
        .feedback-section form .form-group textarea {
            resize: vertical;
        }
        .feedback-section form button {
            padding: 0.75rem 1.5rem;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 0.25rem;
            font-weight: 700;
            cursor: pointer;
        }
    </style>
</head>
<body>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="text-center">
                    <h2 class="display-5 fw-bold">About Harborlights</h2>
                </div>
                <div class="section-content">
                    <h3 class="section-heading">Welcome to Harborlights Hotel</h3>
                    <p class="lead">Nestled in the heart of the City, Harborlights Hotel is the perfect escape from the excitement of everyday life. Harborlights has grown into a favorite spot for both leisure and business travelers, offering a combination of modern elegance and timeless charm.</p>
                </div>
                <div class="section-content">
                    <h3 class="section-heading">Our Story</h3>
                    <p class="lead">Harborlights Hotel was born with the vision of creating a sanctuary where guests can experience unparalleled luxury and comfort. Our journey began with a commitment to exceptional service, and over the years we have continued to evolve, embracing new trends and innovations while staying true to our roots. Today, Harborlights is a testament to our passion for hospitality and dedication to making every stay memorable.</p>
                </div>
                <div class="section-content">
                    <h3 class="section-heading">Our Mission and Vision</h3>
                    <p class="lead"><strong>Mission:</strong> At Harborlights Hotel, our mission is to provide an exceptional hotel experience that exceeds our guests' expectations. We are committed to personalized service, luxurious accommodations, and unforgettable experiences.</p>
                    <p class="lead"><strong>Vision:</strong> Our vision is to be recognized as the leading hospitality destination in the City, known for our exceptional service, sustainable operations, and deep connection to the local community.</p>
                </div>
                <div class="section-content">
                    <h3 class="section-heading">Services and Amenities</h3>
                    <p class="lead">At Harborlights Hotel, we offer a range of services and amenities designed to cater to your every need:</p>
                    <ul class="lead">
                        <li>Elegant interiors equipped with the latest amenities.</li>
                        <li>Gourmet cuisine: Enjoy exquisite dishes prepared by our renowned chefs.</li>
                    </ul>
                </div>
                <div class="section-content">
                    <h3 class="section-heading">Our Team</h3>
                    <p class="lead">Our dedicated team of professionals is at the heart of Harborlights Hotel. From our experienced management to our friendly front-line staff, everyone is committed to making your stay unforgettable. Our team's passion ensures that every guest feels welcomed and valued.</p>
                </div>
                <div class="section-content">
                    <h3 class="section-heading">Social Responsibility</h3>
                    <p class="lead">At Harborlights Hotel, we believe in giving back to our community and protecting our planet. We actively participate in various sustainability initiatives, such as green practices and community outreach programs that support local charities and organizations.</p>
                </div>
                <div class="section-content">
                    <h3 class="section-heading">Contact Us</h3>
                    <p class="lead">We look forward to welcoming you to Harborlights Hotel. For reservations or inquiries, please contact us at:</p>
                    <p class="lead">
                        <strong>Address:</strong> [Hotel Address]<br>
                        <strong>Phone:</strong> [Hotel Phone Number]<br>
                        <strong>Email:</strong> [Hotel Email Address]<br>
                        
                    </p>
                </div>
                <!-- Feedback Section -->
                <div class="section-content feedback-section">
                    <h3 class="section-heading">Feedback</h3>
                    <form action="submitFeedback" method="post">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="feedback">Feedback:</label>
                            <textarea id="feedback" name="feedback" rows="5" required></textarea>
                        </div>
                        <button type="submit">Submit Feedback</button>
                    </form>
                </div>
                <!-- End of Feedback Section -->
            </div>
        </div>
    </div>
</section>

</body>
</html>

# Form Notification Templates

This directory contains universal notification templates for Freeform that can be used with all forms on the site.

## Templates Available

### 1. `admin-form-notification.twig` (HTML Version)
A comprehensive HTML email template that displays form submissions in a clean, professional format with:
- Styled layout with proper typography
- Conditional logic for different field types
- Visual indicators for empty fields and required field violations
- Formatted display for dates, files, checkboxes, etc.

### 2. `.twig` (Plain Text Version)
A plain text version of the notification template for email clients that don't support HTML or for backup text content.

## How to Use These Templates

### Option 1: Copy to Freeform Admin Templates (Recommended)

1. Go to **Freeform → Settings → Email Templates** in your Craft admin panel
2. Click **New Email Template**
3. Fill in the template details:
   - **Name**: `Universal Admin Notification`
   - **Handle**: `universal-admin-notification`
   - **Subject**: `New {{ form.name }} Submission`
   - **From Name**: `Sub` (or your site name)
   - **From Email**: `dev@in-testing.co.uk` (or your admin email)
4. Copy the contents of `admin-form-notification.twig` into the **HTML Body** field
5. Copy the contents of `admin-form-notification-text.twig` into the **Text Body** field
6. Save the template

### Option 2: File-Based Templates

If your Freeform is configured to use file-based templates:

1. Check your Freeform settings for the email template directory
2. Copy these files to that directory
3. Reference them in your form notifications

### Option 3: Custom Integration

You can also modify these templates and include them in your existing notification system.

## Features

### Comprehensive Field Type Support
The templates handle all common Freeform field types:

- **Text fields**: text, email, website, phone, hidden
- **Choice fields**: radio, checkboxes, select, multi-select
- **Date/time fields**: date, time, datetime
- **File uploads**: with file size information
- **Rich content**: textarea with preserved formatting
- **Advanced fields**: tables, signatures, ratings, opinion scales

### Conditional Logic
- Checks if fields have values and displays appropriate messages
- Shows field types for debugging
- Highlights required fields that were left empty
- Handles different data structures (arrays, objects, strings)

### Professional Styling
- Clean, responsive HTML layout
- Consistent typography and spacing
- Color-coded sections for easy scanning
- Mobile-friendly design

### Additional Information
- Submission metadata (ID, timestamp, IP address)
- Form information (name, handle)
- User agent for troubleshooting

## Customization

### Styling
Modify the CSS in the `<style>` section of the HTML template to match your brand colors and typography.

### Content
Add or remove sections as needed for your specific requirements.

### Field Handling
Add custom logic for specific field types or custom fields by extending the conditional statements.

## Forms Using These Templates

These templates work with all the forms currently in your project:
- Contact Page Form (`contactPageForm`)
- Newsletter Form (`newsletterForm`)
- Quick Enquire Form (`quickEnquireForm`)
- Multi Enquiry Form (`MultiEnquiryForm`)
- Single Item Enquiry (`singleItemEnquiry`)
- Wanted Equipment Form (`wantedEquipment`)

## Testing

Before deploying, test the templates with sample submissions to ensure:
1. All field types display correctly
2. Empty fields are handled gracefully
3. Email formatting looks good in different email clients
4. All conditional logic works as expected

## Troubleshooting

### Template Not Loading
- Verify the template is saved correctly in Freeform admin
- Check that the template handle matches in form notifications
- Ensure Freeform has permission to access template files (if file-based)

### Missing Fields
- Check that field handles match between form and template
- Verify field types are correctly identified
- Test with forms that have all field types

### Styling Issues
- Test in multiple email clients
- Consider using more basic CSS for better compatibility
- Use the plain text version as fallback

## Support

For Freeform-specific issues, refer to the [Freeform documentation](https://docs.solspace.com/craft/freeform/v5/).

For template customization questions, check the [Twig documentation](https://twig.symfony.com/doc/). 
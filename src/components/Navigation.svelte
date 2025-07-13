<script>
  let isMenuOpen = false;
  
  function toggleMenu() {
    isMenuOpen = !isMenuOpen;
  }
  
  function closeMenu() {
    isMenuOpen = false;
  }
</script>

<header class="header">
  <nav class="nav">
    <div class="container">
      <div class="nav-content">
        <!-- Logo -->
        <div class="nav-brand">
          <a href="/" class="brand-link">
            <div class="brand-logo">
              <img 
                src="/images/logo/1460-dental-logo.png" 
                alt="1460 Dental Studio Logo"
                class="logo-img"
              />
            </div>
            <div class="brand-text">
              <h1 class="brand-name">1460 Dental Studio</h1>
              <p class="brand-tagline">Georgetown's Trusted Dentist</p>
            </div>
          </a>
        </div>
        
        <!-- Desktop Navigation -->
        <ul class="nav-links">
          <li><a href="/" class="nav-link">Home</a></li>
          <li><a href="/about" class="nav-link">About</a></li>
          <li><a href="/services" class="nav-link">Services</a></li>
          <li><a href="/contact" class="nav-link">Contact</a></li>
        </ul>
        
        <!-- CTA and Mobile Menu -->
        <div class="nav-actions">
          <a href="/contact" class="btn btn-primary nav-cta">Book Appointment</a>
          <button class="mobile-menu-btn" on:click={toggleMenu} aria-label="Toggle menu">
            <span class="hamburger">
              <span></span>
              <span></span>
              <span></span>
            </span>
          </button>
        </div>
      </div>
    </div>
    
    <!-- Mobile Menu -->
    {#if isMenuOpen}
      <div class="mobile-menu" class:open={isMenuOpen}>
        <div class="mobile-menu-content">
          <ul class="mobile-nav-links">
            <li><a href="/" class="mobile-nav-link" on:click={closeMenu}>Home</a></li>
            <li><a href="/about" class="mobile-nav-link" on:click={closeMenu}>About</a></li>
            <li><a href="/services" class="mobile-nav-link" on:click={closeMenu}>Services</a></li>
            <li><a href="/contact" class="mobile-nav-link" on:click={closeMenu}>Contact</a></li>
          </ul>
          
          <div class="mobile-menu-cta">
            <a href="/contact" class="btn btn-primary" on:click={closeMenu}>Book Appointment</a>
            <div class="mobile-contact">
              <p><strong>Call Us:</strong> <a href="tel:+15127635774">(512) 763-5774</a></p>
              <p><strong>Hours:</strong> Mon-Thu 8AM-4PM</p>
            </div>
          </div>
        </div>
      </div>
    {/if}
  </nav>
</header>

<!-- Mobile menu overlay -->
{#if isMenuOpen}
  <div class="mobile-overlay" on:click={closeMenu}></div>
{/if} 
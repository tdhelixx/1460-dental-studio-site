<script lang="ts">
  import { popup, type PopupSettings } from '@skeletonlabs/skeleton';
  
  let isMenuOpen = false;
  
  const servicesPopup: PopupSettings = {
    event: 'hover',
    target: 'servicesPopup',
    placement: 'bottom-start',
    closeQuery: 'a[href]'
  };
  
  const aboutPopup: PopupSettings = {
    event: 'hover',
    target: 'aboutPopup',
    placement: 'bottom-start',
    closeQuery: 'a[href]'
  };
  
  const patientsPopup: PopupSettings = {
    event: 'hover',
    target: 'patientsPopup',
    placement: 'bottom-start',
    closeQuery: 'a[href]'
  };
  
  const services = [
    { name: 'Dental Implants', href: '/services/dental-implants/' },
    { name: 'Veneers', href: '/services/veneers/' },
    { name: 'Teeth Whitening', href: '/services/teeth-whitening/' },
    { name: 'Invisalign', href: '/services/invisalign/' },
    { name: 'Dental Crowns', href: '/services/dental-crowns/' },
    { name: 'Root Canal Therapy', href: '/services/root-canal-therapy/' },
    { name: 'Emergency Dental Care', href: '/services/emergencies/' },
    { name: 'View All Services', href: '/services/' }
  ];
  
  const aboutLinks = [
    { name: 'Our Practice', href: '/about/' },
    { name: 'Meet Our Team', href: '/team-members/' },
    { name: 'Technology', href: '/about/technology/' },
    { name: 'Reviews', href: '/about/reviews/' }
  ];
  
  const patientLinks = [
    { name: 'New Patients', href: '/for-patients/new-patients/' },
    { name: 'Forms', href: '/for-patients/forms/' },
    { name: 'Payment Options', href: '/for-patients/payment-options/' },
    { name: 'Insurance', href: '/for-patients/insurance/' }
  ];
</script>

<header class="bg-surface-50-900-token border-b border-surface-200-700-token">
  <div class="container mx-auto px-4">
    <div class="flex items-center justify-between h-16">
      <!-- Logo -->
      <div class="flex items-center space-x-2">
        <img src="/logo.png" alt="1460 Dental Studio" class="h-8 w-auto" />
        <span class="text-xl font-bold text-primary-700">1460 Dental Studio</span>
      </div>
      
      <!-- Desktop Navigation -->
      <nav class="hidden lg:flex items-center space-x-6">
        <a href="/" class="nav-link">Home</a>
        
        <!-- Services Dropdown -->
        <button
          class="nav-link"
          use:popup={servicesPopup}
        >
          Services
        </button>
        
        <!-- About Dropdown -->
        <button
          class="nav-link"
          use:popup={aboutPopup}
        >
          About
        </button>
        
        <!-- Patients Dropdown -->
        <button
          class="nav-link"
          use:popup={patientsPopup}
        >
          For Patients
        </button>
        
        <a href="/contact/" class="nav-link">Contact</a>
        
        <!-- CTA Button -->
        <a href="/contact/" class="btn variant-filled-primary">
          Book Appointment
        </a>
      </nav>
      
      <!-- Mobile Menu Button -->
      <button
        class="lg:hidden btn-icon variant-filled"
        on:click={() => isMenuOpen = !isMenuOpen}
      >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
        </svg>
      </button>
    </div>
  </div>
</header>

<!-- Services Popup -->
<div class="card p-4 w-48 shadow-xl" data-popup="servicesPopup">
  <nav class="list-nav">
    <ul>
      {#each services as service}
        <li>
          <a href={service.href} class="nav-link block py-2 hover:variant-soft-primary rounded px-2">
            {service.name}
          </a>
        </li>
      {/each}
    </ul>
  </nav>
  <div class="arrow bg-surface-100-800-token" />
</div>

<!-- About Popup -->
<div class="card p-4 w-48 shadow-xl" data-popup="aboutPopup">
  <nav class="list-nav">
    <ul>
      {#each aboutLinks as link}
        <li>
          <a href={link.href} class="nav-link block py-2 hover:variant-soft-primary rounded px-2">
            {link.name}
          </a>
        </li>
      {/each}
    </ul>
  </nav>
  <div class="arrow bg-surface-100-800-token" />
</div>

<!-- Patients Popup -->
<div class="card p-4 w-48 shadow-xl" data-popup="patientsPopup">
  <nav class="list-nav">
    <ul>
      {#each patientLinks as link}
        <li>
          <a href={link.href} class="nav-link block py-2 hover:variant-soft-primary rounded px-2">
            {link.name}
          </a>
        </li>
      {/each}
    </ul>
  </nav>
  <div class="arrow bg-surface-100-800-token" />
</div>

<!-- Mobile Menu -->
{#if isMenuOpen}
<div class="lg:hidden fixed inset-0 z-50 bg-black bg-opacity-50" on:click={() => isMenuOpen = false}>
  <div class="absolute right-0 top-0 h-full w-64 bg-surface-100-800-token shadow-xl">
    <div class="flex flex-col p-4 space-y-4">
      <button 
        class="self-end text-xl btn-icon variant-filled"
        on:click={() => isMenuOpen = false}
      >
        ×
      </button>
      
      <a href="/" class="nav-link block py-2">Home</a>
      
      <div>
        <div class="font-semibold text-primary-700 dark:text-primary-300 mb-2">Services</div>
        {#each services as service}
          <a href={service.href} class="nav-link block py-1 pl-4 text-sm">
            {service.name}
          </a>
        {/each}
      </div>
      
      <div>
        <div class="font-semibold text-primary-700 dark:text-primary-300 mb-2">About</div>
        {#each aboutLinks as link}
          <a href={link.href} class="nav-link block py-1 pl-4 text-sm">
            {link.name}
          </a>
        {/each}
      </div>
      
      <div>
        <div class="font-semibold text-primary-700 dark:text-primary-300 mb-2">For Patients</div>
        {#each patientLinks as link}
          <a href={link.href} class="nav-link block py-1 pl-4 text-sm">
            {link.name}
          </a>
        {/each}
      </div>
      
      <a href="/contact/" class="nav-link block py-2">Contact</a>
      
      <a href="/contact/" class="btn variant-filled-primary text-center">
        Book Appointment
      </a>
    </div>
  </div>
</div>
{/if} 
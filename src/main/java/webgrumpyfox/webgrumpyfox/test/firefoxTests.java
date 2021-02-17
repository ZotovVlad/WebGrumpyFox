package webgrumpyfox.webgrumpyfox.test;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.util.concurrent.TimeUnit;

import static org.junit.jupiter.api.Assertions.assertEquals;

class firefoxTests {

    private static WebDriver driver;

    @BeforeEach
    public void setup() {
        System.setProperty("webdriver.gecko.driver", "E:\\webgrumpyfox\\src\\main\\java\\webgrumpyfox\\webgrumpyfox\\test\\driver\\geckodriver.exe");
        driver = new FirefoxDriver();
        driver.manage().window().maximize();
        driver.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS);
    }

    @Test
    public void login() throws InterruptedException {
        driver.get("http://webgrumpyfox.ikhudyakov.nl/");
        WebElement email = driver.findElement(By.id("exampleInputEmail1"));
        email.sendKeys("bajurus@bajurus.com");
        WebElement password = driver.findElement(By.id("exampleInputPassword1"));
        password.sendKeys("bajurus");
        WebElement loginField = driver.findElement(By.name("authentication"));
        loginField.click();
        Thread.sleep(2000);
        assertEquals(driver.findElement(By.className("nav-link")).getText(), "Home");
    }

    @Test
    public void registration() throws InterruptedException {
        driver.get("http://webgrumpyfox.ikhudyakov.nl/");
        Thread.sleep(1000);
        WebElement signUp = driver.findElement(By.xpath("/html/body/div/div/div/div/ul/li[2]/a"));
        signUp.click();
        WebElement lastName = driver.findElement(By.id("exampleInputLastName"));
        lastName.sendKeys("bajurus");
        WebElement firstName = driver.findElement(By.id("exampleInputFirstName"));
        firstName.sendKeys("bajurus");
        WebElement email = driver.findElement(By.id("exampleInputEmail2"));
        email.sendKeys("bajurus@bajurus.com");
        WebElement password = driver.findElement(By.id("exampleInputPassword2"));
        password.sendKeys("bajurus");
        WebElement passwordConfirm = driver.findElement(By.id("exampleInputPassword3"));
        passwordConfirm.sendKeys("bajurus");
        WebElement registrationField = driver.findElement(By.name("registration"));
        registrationField.click();
        signUp = driver.findElement(By.xpath("/html/body/div/div/div/div/ul/li[2]/a"));
        signUp.click();
        Thread.sleep(2000);
        assertEquals(driver.findElement(By.xpath("/html/body/div/div/div/div/div/div[2]/form/div[3]/p")).getText(), "User with this email address already exists");
    }

    @Test
    public void searchFound() throws InterruptedException {
        driver.get("https://www.studjent.website/");
        WebElement search = driver.findElement(By.id("search-str-desktop"));
        search.sendKeys("c#");
        WebElement loginField = driver.findElement(By.className("button-search"));
        loginField.click();
        Thread.sleep(2000);
        assertEquals(driver.findElement(By.xpath("/html/body/div[1]/div/div[2]/div/div/div[2]/div[1]/h5")).getText(), "Найдены 2 вакансии по запросу 'c#'");
    }

    @Test
    public void searchNotFound() throws InterruptedException {
        driver.get("https://www.studjent.website/");
        WebElement search = driver.findElement(By.id("search-str-desktop"));
        search.sendKeys("Java");
        WebElement loginField = driver.findElement(By.className("button-search"));
        loginField.click();
        Thread.sleep(2000);
        assertEquals(driver.findElement(By.xpath("/html/body/div[1]/div/div[2]/div/div/div[2]/div[1]/h5")).getText(), "Найдено 0 вакансий по запросу 'Java'");
    }

    @AfterEach
    public void after() {
        driver.quit();
    }
}
